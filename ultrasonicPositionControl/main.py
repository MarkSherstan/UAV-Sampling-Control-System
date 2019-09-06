from dronekit import connect, VehicleMode, LocationGlobal, LocationGlobalRelative, LocationLocal
from pymavlink import mavutil
from threading import Thread
import pandas as pd
import numpy as np
import datetime
import time
import math
import struct
import copy
import serial

class Controller:
	def __init__(self):
		# Initial conditions
		self.rollAngle = 0.0
		self.pitchAngle = 0.0
		self.yawAngle = 0.0
		self.yawRate = 0.0
		self.thrust = 0.5
		self.duration = 0.08
		self.heading = 0

		# Constraints for roll, pitch, yaw and thrust
		self.minValNE = -3.1415/8
		self.maxValNE = 3.1415/8
		self.minValD = -1
		self.maxValD = 1
		self.minValYaw = -3.1415/4
		self.maxValYaw = 3.1415/4

		# Controller PD Gains
		self.kp = 0.3
		self.ki = 0
		self.kd = 0.2

		# PID variables
		self.northPreviousError = 0
		self.eastPreviousError = 0
		self.northI = 0
		self.eastI = 0

		# Controller
		self.northDesired = None
		self.eastDesired = None
		self.downDesired = None
		self.startTime = None

		# Thrust Control
		self.kThrottle = 0.5
		self.one2one = [-1, -0.04, 0.04, 1]
		self.zero2one = [0, 0.5, 0.5, 1]

		# Yaw control
		self.kYaw = 2
		self.yawConstrained = [-3.1415/4, -3.1415/90, 3.1415/90, 3.1415/4]
		self.yawRateInterp = [-3.1415/2, 0, 0, 3.1415/2]

		# Data Logging
		self.tempData = []

	def sendAttitudeTarget(self, vehicle):
		# https://mavlink.io/en/messages/common.html#SET_ATTITUDE_TARGET
		#
		# thrust: 0 <= thrust <= 1, as a fraction of maximum vertical thrust.
		#         Note that as of Copter 3.5, thrust = 0.5 triggers a special case in
		#         the code for maintaining current altitude.
		#             Thrust >  0.5: Ascend
		#             Thrust == 0.5: Hold the altitude
		#             Thrust <  0.5: Descend
		#
		# Mappings: If any of these bits are set, the corresponding input should be ignored.
		# bit 1: body roll rate, bit 2: body pitch rate, bit 3: body yaw rate.
		# bit 4-bit 6: reserved, bit 7: throttle, bit 8: attitude

		# Prevent none type error on yaw
		self.yawAngle = vehicle.attitude.yaw

		# Create the mavlink message
		msg = vehicle.message_factory.set_attitude_target_encode(
			0, # time_boot_ms
			0, # Target system
			0, # Target component
			0b00000000, # If bit is set corresponding input ignored (mappings)
			self.euler2quaternion(self.rollAngle, self.pitchAngle, self.yawAngle), # Quaternion
			0, # Body roll rate in radian
			0, # Body pitch rate in radian
			self.yawRate, # Body yaw rate in radian/second
			self.thrust # Thrust
		)

		# Send the constructed message
		vehicle.send_mavlink(msg)

	def euler2quaternion(self, roll, pitch, yaw):
		# Euler angles (rad) to quaternion
		yc = math.cos(yaw * 0.5)
		ys = math.sin(yaw * 0.5)
		rc = math.cos(roll * 0.5)
		rs = math.sin(roll * 0.5)
		pc = math.cos(pitch * 0.5)
		ps = math.sin(pitch * 0.5)

		q0 = yc * rc * pc + ys * rs * ps
		q1 = yc * rs * pc - ys * rc * ps
		q2 = yc * rc * ps + ys * rs * pc
		q3 = ys * rc * pc - yc * rs * ps

		return [q0, q1, q2, q3]

	def constrain(self, val, minVal, maxVal):
		return max(min(maxVal, val), minVal)

	def PID(self, error, errorPrev, I, dt):
		# Run the PD controller
		P = self.kp * error
		I = self.ki * (I + error * dt)
		D = self.kd * ((error - errorPrev) / dt)
		return (P + I + D), I

	def positionControl(self, vehicle, s):
		# Set parameters
		self.northDesired = 0.4
		self.eastDesired = 0.4
		self.downDesired = 0.4
		self.startTime = time.time()

		try:
			while(True):
				# Get current values
				north1 = s.dataOut[0] * 0.01
				north2 = s.dataOut[1] * 0.01
				east1 = s.dataOut[2] * 0.01
				east2 = s.dataOut[3] * 0.01
				downCurrentPos = s.dataOut[4] * 0.01
				deltaT = time.time() - self.startTime

				# Average the distances
				northCurrentPos = (north1 + north2) / 2
				eastCurrentPos = (east1 + east2) / 2

				# Angle calculations
				if abs(north1 - north2) < 0.2286:
					yawNorth = -math.asin((north1 - north2) / 0.2286)
				else:
					print 'North Error'
					print round(north1, 2), round(north2, 2)
					continue

				if abs(east1 - east2) < 0.2445:
					yawEast = -math.asin((east1 - east2) / 0.2445)
				else:
					print 'East Error'
					print round(east1, 2), round(east2, 2)
					continue

				yawAvg = (yawNorth + yawEast) / 2

				# Print data
				print 'N: ', round(north1, 2), round(north2, 2), round(northCurrentPos, 2)
				print 'E: ', round(east1, 2), round(east2, 2), round(eastCurrentPos, 2)
				print 'D: ', round(downCurrentPos, 2)
				print 'Angle: ', round(math.degrees(yawNorth),2), round(math.degrees(yawEast),2), round(math.degrees(yawAvg),2)
				print 'Yaw sign: ', math.degrees(vehicle.attitude.yaw), '\n'

				# yaw rate in rad/s
				time.sleep(0.75)

				continue

				# Error caculations
				errorNorth = northCurrentPos - self.northDesired
				errorEast = eastCurrentPos - self.eastDesired
				errorDown = downCurrentPos - self.downDesired

				# Update previous position(s) if none
				if self.northPreviousPos is None:
					self.northPreviousPos = northCurrentPos

				if self.eastPreviousPos is None:
					self.eastPreviousPos = eastCurrentPos

				# Run some control
				pitchControl = self.PD(errorNorth, northCurrentPos, self.northPreviousPos, deltaT)
				rollControl = self.PD(errorEast, eastCurrentPos, self.eastPreviousPos, deltaT)
				thrustControl = -self.constrain(errorDown * self.kThrottle, self.minValD, self.maxValD)

				# Save the previous position
				self.northPreviousPos = northCurrentPos
				self.eastPreviousPos = eastCurrentPos

				# Calculate the control
				self.pitchAngle = -self.constrain(pitchControl, self.minValNE, self.maxValNE)
				self.rollAngle = self.constrain(rollControl, self.minValNE, self.maxValNE)
				self.thrust = np.interp(thrustControl, self.one2one, self.zero2one)

				# Send the command with small buffer
				self.sendAttitudeTarget(vehicle)
				time.sleep(0.08)

				# Display data to user
				# Actual
				print 'Actual ->\t', \
					'\tN: ', round(northCurrentPos,2), \
					'\tE: ', round(eastCurrentPos,2), \
					'\tD: ', round(downCurrentPos,2)
				# Error
				print 'Error ->\t', \
					'\tN: ', round(errorNorth,2), \
					'\tE: ', round(errorEast,2), \
					'\tD: ', round(errorDown,2)
				# Controller
				print 'Controller ->\t', \
					'\tN: ', round(self.pitchAngle,2), \
					'\tE: ', round(self.rollAngle,2), \
					'\tD: ', round(self.thrust,2)
				# Print actual roll and pitch
				print 'Roll: ', round(math.degrees(vehicle.attitude.roll),3), \
					'Pitch: ', round(math.degrees(vehicle.attitude.pitch),3), '\n'

				# Log data
				self.tempData.append([vehicle.mode.name, (time.time() - self.startTime), self.yawAngle, \
					vehicle.attitude.roll, vehicle.attitude.pitch, vehicle.attitude.yaw, \
					northCurrentPos, eastCurrentPos, downCurrentPos, \
					errorNorth, errorEast, errorDown, \
					self.pitchAngle, self.rollAngle, self.thrust])

		except KeyboardInterrupt:
			# Close thread and serial connection
			s.close()

			# Create file name
			now = datetime.datetime.now()
			fileName = now.strftime("%Y-%m-%d %H:%M:%S") + ".csv"

			# Write data to CSV and display to user
			df = pd.DataFrame(self.tempData, columns=['Mode', 'Time', 'Yaw_SP', 'Roll', 'Pitch', 'Yaw', 'northCurrentPos', 'eastCurrentPos',
									   'downCurrentPos', 'errorNorth', 'errorEast', 'errorDown', 'self.pitchAngle', 'self.rollAngle', 'self.thrust'])

			df.to_csv(fileName, index=None, header=True)

			print('File saved to:\t' + fileName)

	def altitudeTest(self, vehicle, s):
		# Set desired parameters
		self.downDesired = 0.4
		self.Angle = [-3.1415/8, 0, 0, 3.1415/8]
		printTimer = time.time()
		self.startTime = time.time()

		try:
			while(True):
				# Get current values
				rollRC = vehicle.channels['2']
				pitchRC = vehicle.channels['3']
				downCurrentPos = s.dataOut[4] * 0.01

				# Run thrust calculations
				errorDown = downCurrentPos - self.downDesired
				thrustControl = -self.constrain(errorDown * self.kThrottle, self.minValD, self.maxValD)

				# Set controller input
				self.thrust = np.interp(thrustControl, self.one2one, self.zero2one)
				self.rollAngle = -np.interp(rollRC, [1018, 1500, 1560, 2006], self.Angle)
				self.pitchAngle = -np.interp(pitchRC, [982, 1440, 1500, 1986], self.Angle)

				# Send the command with small buffer
				self.sendAttitudeTarget(vehicle)
				time.sleep(0.08)

				# Print data to the user every half second
				if time.time() > printTimer + 0.5:
					print 'Roll RC: ', rollRC, ' Angle: ', round(math.degrees(self.rollAngle),1), round(math.degrees(vehicle.attitude.roll),1)
					print 'Pitch RC: ', pitchRC, ' Angle: ', round(math.degrees(self.pitchAngle),1), round(math.degrees(vehicle.attitude.pitch),1)
					print 'Down: ', downCurrentPos, ' Thrust: ', self.thrust, '\n'
					printTimer = time.time()

				# Log data
				self.tempData.append([vehicle.mode.name, (time.time() - self.startTime), \
					rollRC, self.rollAngle, vehicle.attitude.roll,
					pitchRC, self.pitchAngle, vehicle.attitude.pitch,
					self.thrust, downCurrentPos])

		except KeyboardInterrupt:
			# Close thread and serial connection
			s.close()

			# Create file name
			now = datetime.datetime.now()
			fileName = now.strftime("%Y-%m-%d %H:%M:%S") + ".csv"

			# Write data to CSV and display to user
			df = pd.DataFrame(self.tempData, columns=['Mode', 'Time', 'RC Roll', 'Roll Control', 'Roll Actual',
				'RC Pitch', 'Pitch Control', 'Pitch Actual', 'Thrust', 'Down Pos'])

			df.to_csv(fileName, index=None, header=True)

			print('File saved to:\t' + fileName)

	def yawControlTest(self, vehicle, s):
		# Set desired parameters
		self.downDesired = 0.4
		self.Angle = [-3.1415/8, 0, 0, 3.1415/8]
		printTimer = time.time()
		self.startTime = time.time()

		try:
			while(True):
				# Get current values
				rollRC = vehicle.channels['2']
				pitchRC = vehicle.channels['3']
				downCurrentPos = s.dataOut[4] * 0.01

				# Run thrust calculations
				errorDown = downCurrentPos - self.downDesired
				thrustControl = -self.constrain(errorDown * self.kThrottle, self.minValD, self.maxValD)

				# Yaw calcs
				data = [ii * 0.01 for ii in s.dataOut]
				east1 = data[2];  east2 = data[3];
				eastCurrentPos = (east1 + east2) / 2

				if abs(east1 - east2) < 0.2445:
					self.heading = -math.asin((east1 - east2) / 0.2445)

				# Set controller input
				self.thrust = np.interp(thrustControl, self.one2one, self.zero2one)
				self.rollAngle = -np.interp(rollRC, [1018, 1534, 1536, 2006], self.Angle)
				self.pitchAngle = -np.interp(pitchRC, [982, 1451, 1453, 1986], self.Angle)
				self.yawRate = math.radians(np.interp(math.degrees(self.heading), [-30, -4, 4, 30], [-90, 0, 0, 90]))

				# Send the command with small buffer
				self.sendAttitudeTarget(vehicle)
				time.sleep(0.08)

				# Print data to the user every half second
				if time.time() > printTimer + 0.5:
					print 'Roll RC: ', rollRC, ' Angle: ', round(math.degrees(self.rollAngle),1), round(math.degrees(vehicle.attitude.roll),1)
					print 'Pitch RC: ', pitchRC, ' Angle: ', round(math.degrees(self.pitchAngle),1), round(math.degrees(vehicle.attitude.pitch),1)
					print 'Down: ', downCurrentPos, ' Thrust: ', self.thrust
					print 'East: ', east1, east2, eastCurrentPos
					print 'Heading: ', round(math.degrees(self.heading),2), 'Rate: ', round(math.degrees(self.yawRate),2), '\n'
					printTimer = time.time()

				# Log data
				self.tempData.append([(time.time() - self.startTime), vehicle.mode.name,
					east1, east2, eastCurrentPos, math.degrees(self.heading), math.degrees(self.yawRate),
					rollRC, math.degrees(self.rollAngle), math.degrees(vehicle.attitude.roll),
					pitchRC, math.degrees(self.pitchAngle), math.degrees(vehicle.attitude.pitch),
					self.thrust, downCurrentPos,
					math.degrees(vehicle.attitude.yaw), vehicle.heading])

		except KeyboardInterrupt:
			# Close thread and serial connection
			s.close()

			# Create file name
			now = datetime.datetime.now()
			fileName = now.strftime("YawControlTest_%Y-%m-%d %H:%M:%S") + ".csv"

			# Write data to CSV and display to user
			df = pd.DataFrame(self.tempData, columns=['Time', 'Mode', 'East1', 'East2', 'EastAvg',
				'Heading', 'yawRate', 'RC Roll', 'Roll Control', 'Roll Actual',
				'RC Pitch', 'Pitch Control', 'Pitch Actual', 'Thrust', 'Down Pos',
				'vehicle.yaw', 'vehicle.heading'])

			df.to_csv(fileName, index=None, header=True)

			print('File saved to:\t' + fileName)

	def printData(self, vehicle, s):
		# Timer Initialize
		self.startTime = time.time()

		try:
			while(True):
			# Get Data
			data = s.dataOut

			# Print Data
			print 'N: ', data[0], data[1]
			print 'E: ', data[2], data[3]
			print 'D: ', data[4]

			# Log data
			self.tempData.append([(time.time()-self.startTime), data[0], data[1], data[2], data[3], data[4]])

			# 100 Hz rate
			time.sleep(0.01)

		except KeyboardInterrupt:
			# Close thread and serial connection
			s.close()

			# Create file name
			now = datetime.datetime.now()
			fileName = now.strftime("Sensor_%m-%d_%H-%M-%S") + ".csv"

			# Write data to CSV and display to user
			df = pd.DataFrame(self.tempData, columns=['Time', 'N1', 'N2', 'E1', 'E2', 'D'])
			df.to_csv(fileName, index=None, header=True)

			# Display close message
			print('File saved to:\t' + fileName)

	def RCcontrol(self, vehicle, s):
		# Set desired parameters
		self.downDesired = 0.7
		self.Angle = [-3.1415/8, 0, 0, 3.1415/8]
		self.angleRate = [-3.1415/2, 0, 0, 3.1415/2]
		printTimer = time.time()

		# RC Mappings
		rollPWM = [1018, 2006]; rollMid = rollPWM[0] + (rollPWM[1] - rollPWM[0])/2
		pitchPWM = [982, 1986]; pitchMid = pitchPWM[0] + (pitchPWM[1] - pitchPWM[0])/2
		yawPWM =  [1000, 2000]; yawMid = yawPWM[0] + (yawPWM[1] - yawPWM[0])/2

		try:
			while(True):
				# Get current values
				rollRC = vehicle.channels['2']
				pitchRC = vehicle.channels['3']
				yawRC = vehicle.channels['4']
				downCurrentPos = s.dataOut[4] * 0.01

				# Run thrust calculations
				errorDown = downCurrentPos - self.downDesired
				thrustControl = -self.constrain(errorDown * self.kThrottle, self.minValD, self.maxValD)
				self.thrust = np.interp(thrustControl, self.one2one, self.zero2one)

				# Set roll, pitch, and yaw inputs
				self.rollAngle = -np.interp(rollRC, [rollPWM[0], rollMid-2, rollMid+2, rollPWM[1]], self.Angle)
				self.pitchAngle = -np.interp(pitchRC, [pitchPWM[0], pitchMid-2, pitchMid+2, pitchPWM[1]], self.Angle)
				self.yawRate = np.interp(yawRC, [yawPWM[0], yawMid-2, yawMid+2, yawPWM[1]], self.angleRate)

				# Send the command with small buffer
				self.sendAttitudeTarget(vehicle)
				time.sleep(0.05)

				# Print data to the user every half second
				if time.time() > printTimer + 0.5:
					print 'Roll RC: ', round(math.degrees(self.rollAngle),1)
					print 'Pitch RC: ', round(math.degrees(self.pitchAngle),1)
					print 'Yaw RC: ', round(math.degrees(self.yawRate),1)
					print 'Down: ', downCurrentPos, ' Thrust: ', self.thrust, '\n'
					printTimer = time.time()

		except KeyboardInterrupt:
			# Close thread and serial connection
			s.close()

			# Display close message
			print 'Closing...\n'

	def trajectoryControl(self, vehicle, s):
		# Initialize variables
		T = 5			# Trajectory time
		N = 50			# Total data points for initial position
		counter = 0		# Counter to track trajectory location
		self.startTime = time.time()
		northCurrentPos = 0
		eastCurrentPos = 0

		# Set the desired NED locations
		self.northDesired = 0.4
		self.eastDesired = 0.4
		self.downDesired = 0.4

		try:
			# Wait until mode has changed
			while not vehicle.mode.name=='GUIDED_NOGPS':
				data = [ii * 0.01 for ii in s.dataOut]
				print ' Waiting for GUIDED_NOGPS', data
				self.logData(vehicle, data, 0, 0)
				time.sleep(0.2)

			# Take N readings of data at 100 Hz once GUIDED_NOGPS mode is active
			for ii in range(N):
				data = [ii * 0.01 for ii in s.dataOut]
				northCurrentPos += (data[0] + data[1]) / 2
				eastCurrentPos += (data[2] + data[3]) / 2
				self.logData(vehicle, data, 0, 0)
				time.sleep(0.01)

			# Find the average position
			northCurrentPos /= N
			eastCurrentPos /= N

			# Generate a trajectory that should take T seconds
			northIC = [northCurrentPos, self.northDesired, 0, 0, 0, 0]
			eastIC = [eastCurrentPos, self.eastDesired, 0, 0, 0, 0]

			pN = self.trajectoryGen(northIC, T, self.duration)
			pE = self.trajectoryGen(eastIC, T, self.duration)

			# Start timer
			self.startTime = time.time()
			printTimer = time.time()
			prevTime = time.time()

			# Run until stopped
			while (True):
				# Get current values
				data = [ii * 0.01 for ii in s.dataOut]
				north1 = data[0]; north2 = data[1];
				east1 = data[2];  east2 = data[3];
				downCurrentPos = data[4]

				# Average the distances
				northCurrentPos = (north1 + north2) / 2
				eastCurrentPos = (east1 + east2) / 2

				# Heading calculations
				if ((abs(north1 - north2) < 0.2286) and (abs(east1 - east2) < 0.2445)):
					yawNorth = -math.asin((north1 - north2) / 0.2286)
					yawEast = -math.asin((east1 - east2) / 0.2445)
					self.heading = (yawNorth + yawEast) / 2
				elif abs(north1 - north2) < 0.2286:
					self.heading = -math.asin((north1 - north2) / 0.2286)
				elif abs(east1 - east2) < 0.2445:
					self.heading = -math.asin((east1 - east2) / 0.2445)
				else:
					pass

				# Set the desired position based on time counter index
				if counter < len(pN):
					desiredN = pN[counter]
					desiredE = pE[counter]
				else:
					desiredN = self.northDesired
					desiredE = self.eastDesired

				# Error caculations
				errorNorth = desiredN - northCurrentPos
				errorEast = desiredE - eastCurrentPos
				errorDown = self.downDesired - downCurrentPos

				# Time elapsed
				dt = time.time() - prevTime
				prevTime = time.time()

				# Run some control
				rollControl, self.eastI = self.PID(errorEast, self.eastPreviousError, self.eastI, dt)
				pitchControl, self.northI = self.PID(errorNorth, self.northPreviousError, self.northI, dt)
				yawControl = self.constrain(self.heading * self.kYaw, self.minValYaw, self.maxValYaw)
				thrustControl = self.constrain(errorDown * self.kThrottle, self.minValD, self.maxValD)

				# Update previous error
				self.northPreviousError = errorNorth
				self.eastPreviousError = errorEast

				# Set the controller values
				self.rollAngle = -self.constrain(rollControl, self.minValNE, self.maxValNE)
				self.pitchAngle = self.constrain(pitchControl, self.minValNE, self.maxValNE)
				self.yawRate = -np.interp(yawControl, self.yawConstrained, self.yawRateInterp)
				self.thrust = np.interp(thrustControl, self.one2one, self.zero2one)

				# Print data every 0.75 seconds
				if (time.time() > printTimer + 0.75):
					print 'N: ', round(north1, 2), round(north2, 2), round(northCurrentPos, 2)
					print 'E: ', round(east1, 2), round(east2, 2), round(eastCurrentPos, 2)
					print 'D: ', round(downCurrentPos, 2)
					print 'Heading: ', round(math.degrees(self.heading), 2)

					print 'Roll: ', round(math.degrees(self.rollAngle), 2), round(math.degrees(vehicle.attitude.roll), 2)
					print 'Pitch: ', round(math.degrees(self.pitchAngle), 2), round(math.degrees(vehicle.attitude.pitch), 2)
					print 'Yaw: ', round(math.degrees(self.yawRate), 2), round(math.degrees(vehicle.attitude.yaw), 2), vehicle.heading
					print 'Thrust: ', round(self.thrust, 2), '\n'

					printTimer = time.time()

				# Send the command, sleep, and increase counter
				self.sendAttitudeTarget(vehicle)
				self.logData(vehicle, data, desiredN, desiredE)
				time.sleep(self.duration)
				counter += 1

		except KeyboardInterrupt:
			# Close thread and serial connection
			s.close()

			# Create file name
			now = datetime.datetime.now()
			fileName = now.strftime("%Y-%m-%d %H:%M:%S") + ".csv"

			# Write data to CSV and display to user
			df = pd.DataFrame(self.tempData, columns=['Mode', 'Time', 'YawSP', 'Roll', 'Pitch', 'Yaw', 'Heading',
				'N1', 'N2', 'E1', 'E2', 'D', 'northCurrentPos', 'eastCurrentPos', 'calcHeading',
				'desiredN', 'desiredE', 'desiredD', 'rollInput', 'pitchInput', 'yawInput', 'thrustInput'])

			df.to_csv(fileName, index=None, header=True)

			print('File saved to:\t' + fileName)

	def trajectoryGen(self, IC, T, sampleRate):
		# Define time array and storage variables
		tt = np.linspace(0, T, round(T/sampleRate), endpoint=True)
		pos = []; vel = []; acc = [];

		# Find coeffcients of 5th order polynomial using matrix operations
		A = np.array([[0, 0, 0, 0, 0, 1],
					[np.power(T,5), np.power(T,4), np.power(T,3), np.power(T,2), T, 1],
					[0, 0, 0, 0, 1, 0],
					[5*np.power(T,4), 4*np.power(T,3), 3*np.power(T,2), 2*T, 1, 0],
					[0, 0, 0, 2, 0, 0],
					[20*np.power(T,3), 12*np.power(T,2), 6*T, 2, 0, 0]])

		b = np.array([IC[0], IC[1], IC[2], IC[3], IC[4], IC[5]])

		x = np.linalg.solve(A, b)

		# Unpack coeffcients
		A = x[0]; B = x[1]; C = x[2]; D = x[3]; E = x[4]; F = x[5];

		# Calculate the trajectory properties for each time step and store
		for t in tt:
			pos.append(A*np.power(t,5) + B*np.power(t,4) + C*np.power(t,3) + D*np.power(t,2) + E*t + F)
			vel.append(5*A*np.power(t,4) + 4*B*np.power(t,3) + 3*C*np.power(t,2) + 2*D*t + E)
			acc.append(20*A*np.power(t,3) + 12*B*np.power(t,2) + 6*C*t + 2*D)

		# Return the resulting position
		return pos

	def logData(self, vehicle, data, desiredN, desiredE):
		self.tempData.append([vehicle.mode.name, (time.time() - self.startTime), self.yawAngle,
			math.degrees(vehicle.attitude.roll), math.degrees(vehicle.attitude.pitch), math.degrees(vehicle.attitude.yaw), vehicle.heading,
			data[0], data[1], data[2], data[3], data[4],
			(data[0] + data[1]) / 2, (data[2] + data[3]) / 2, math.degrees(self.heading),
			desiredN, desiredE, self.downDesired,
			math.degrees(self.rollAngle), math.degrees(self.pitchAngle), math.degrees(self.yawRate), self.thrust])

class DAQ:
	def __init__(self, serialPort, serialBaud, dataNumBytes, numSignals):
		# Class / object / constructor setup
		self.port = serialPort
		self.baud = serialBaud
		self.dataNumBytes = dataNumBytes
		self.numSignals = numSignals
		self.rawData = bytearray(numSignals * dataNumBytes)
		self.dataType = 'h'
		self.isRun = True
		self.isReceiving = False
		self.thread = None
		self.dataOut = []

		# Connect to serial port
		print('Trying to connect to: ' + str(serialPort) + ' at ' + str(serialBaud) + ' BAUD.')
		try:
			self.serialConnection = serial.Serial(serialPort, serialBaud, timeout=4)
			print('Connected to ' + str(serialPort) + ' at ' + str(serialBaud) + ' BAUD.')
		except:
			print("Failed to connect with " + str(serialPort) + ' at ' + str(serialBaud) + ' BAUD.')
			print("Terminating program now...")
			quit()

	def readSerialStart(self):
		# Create a thread
		if self.thread == None:
			self.thread = Thread(target=self.backgroundThread)
			self.thread.start()

			# Block till we start receiving values
			while self.isReceiving != True:
				time.sleep(0.1)

	def backgroundThread(self):
		# Pause and clear buffer to start with a good connection
		time.sleep(2)
		self.serialConnection.reset_input_buffer()

		# Read until closed
		while (self.isRun):
			self.getSerialData()
			self.isReceiving = True

	def getSerialData(self):
		# Initialize data out
		tempData = []

		# Check for header bytes and then read bytearray if header satisfied
		if (struct.unpack('B', self.serialConnection.read())[0] is 0x9F) and (struct.unpack('B', self.serialConnection.read())[0] is 0x6E):
			self.rawData = self.serialConnection.read(self.numSignals * self.dataNumBytes)

			# Copy raw data to new variable and set up the data out variable
			privateData = copy.deepcopy(self.rawData[:])

			# Loop through all the signals and decode the values
			for i in range(self.numSignals):
				data = privateData[(i*self.dataNumBytes):(self.dataNumBytes + i*self.dataNumBytes)]
				value, = struct.unpack(self.dataType, data)
				tempData.append(value)

		# Check if data is usable otherwise repeat (recursive function)
		if tempData:
			self.dataOut = tempData
		else:
			return self.getSerialData()

	def close(self):
		# Close the serial port connection
		self.isRun = False
		self.thread.join()
		self.serialConnection.close()

		print('Disconnected from Arduino...')

def main():
	# Connect to the Vehicle
	connection_string = "/dev/ttyS1"
	print('Connecting to vehicle on: %s\n' % connection_string)
	vehicle = connect(connection_string, wait_ready=["attitude"], baud=57600)

	# Connect to serial port Arduino
	portName = '/dev/ttyACM0'
	baudRate = 9600
	dataNumBytes = 2
	numSignals = 5

	# Set up serial port class
	s = DAQ(portName, baudRate, dataNumBytes, numSignals)
	s.readSerialStart()

	# Set up controller class
	C = Controller()

	# Run a test
	# C.altitudeTest(vehicle, s)
	# C.positionControl(vehicle, s)
	# C.deskTest(vehicle, s)
	# C.trajectoryControl(vehicle, s)
	C.yawControlTest(vehicle,s)


# Main loop
if __name__ == '__main__':
	main()