from payloads import SerialComs, QuickConnect
from filter import MovingAverage, TimeSync
from multiprocessing import Process, Queue
from dronekit import connect, VehicleMode
from vision import Vision, VisionData
from controller import Controller
from setpoints import SetPoints
from pymavlink import mavutil
import pandas as pd
import numpy as np
import statistics
import datetime
import math
import time

def main():
    # Connect to the vehicle
    connectionString = '/dev/ttyTHS1'
    print('Connecting to vehicle on: %s\n' % connectionString)
    vehicle = connect(connectionString, wait_ready=['attitude'], baud=1500000)

    # Set attitude request message rate
    msg = vehicle.message_factory.request_data_stream_encode(
        0, 0,
        mavutil.mavlink.MAV_DATA_STREAM_EXTRA1,
        150, # Rate (Hz)
        1)   # Turn on
    vehicle.send_mavlink(msg)
    time.sleep(0.5)

    # Connect to vision, create the queue, start the core, and start the retrieval thread
    V = Vision()
    Q = Queue()
    P = Process(target=V.run, args=(Q, ))
    P.start()
    vData = VisionData(Q)

    # Connect to control scheme and prepare setpoints
    C = Controller(vehicle)
    SP = SetPoints(state='Trajectory', nDesired=-10, eDesired=40, dDesired=10, yDesired=0)
    modeState = 1
    
    # Connect to serial port and quick connect
    s = SerialComs()
    qc = QuickConnect(s)

    # Moving average for velocity and acceleration (trajectory generation)
    winSizeVel = 5;                      winSizeAcc = 10
    nVelAvg = MovingAverage(winSizeVel); nAccAvg = MovingAverage(winSizeAcc)
    eVelAvg = MovingAverage(winSizeVel); eAccAvg = MovingAverage(winSizeAcc)
    dVelAvg = MovingAverage(winSizeVel); dAccAvg = MovingAverage(winSizeAcc)

    # Loop rate stabilization
    sync = TimeSync(1/30)
    sync.startTimer()

    # Data logging
    data = []

    # Timers
    print('Start')
    startTime = time.time()
    loopTimer = time.time()
    sync.startTimer()
    C.startController()

    try:
        while(True):
            # Stabilize rate
            sleepTimer = time.time()
            time2delay = sync.stabilize()
            actualDelay = time.time() - sleepTimer

            # Get vision and IMU data
            vData.update()
        
            # Calculate control and execute
            actualPos = [vData.N.Pos, vData.E.Pos, vData.D.Pos, vData.Y.Ang]
            desiredPos = SP.getDesired()
            rollControl, pitchControl, yawControl, thrustControl, landState = C.positionControl(actualPos, desiredPos)
            C.sendAttitudeTarget(rollControl, pitchControl, yawControl, thrustControl)
            
            # If landed, engange the quick connect
            if (landState == True) and (modeState == 0):
                qc.engage()
                # SP.reset(-10, 40, 100, 0)
                # SP.update(actualPos, [0, 0, 0], [0, 0, 0])
                C.resetController()
                landState = True
            else:
                landState = False
                
            # Get actual vehicle attitude
            roll, pitch, yaw = C.getVehicleAttitude()

            # Calculate the sample rate
            tempTime = time.time()
            freqLocal = (1.0 / (tempTime - loopTimer))
            loopTimer = tempTime

            # Log data
            data.append([vehicle.mode.name, time.time()-startTime, 
                        freqLocal, time2delay, actualDelay,
                        desiredPos[0], desiredPos[1], desiredPos[2],
                        roll, pitch, yaw,
                        rollControl, pitchControl, yawControl, thrustControl,
                        vData.N.Pos, vData.E.Pos, vData.D.Pos, vData.Y.Ang,
                        vData.N.Vel, vData.E.Vel, vData.D.Vel, vData.Y.Vel,
                        vData.N.Acc, vData.E.Acc, vData.D.Acc,
                        vData.N.Avg, vData.E.Avg, vData.D.Avg, vData.Y.Avg,
                        vData.N.Dif, vData.E.Dif, vData.D.Dif, vData.Y.Dif,
                        vData.N.One, vData.E.One, vData.D.One, vData.Y.One,
                        vData.N.Two, vData.E.Two, vData.D.Two, vData.Y.Two,
                        landState, Q.qsize(), vData.T.time, vData.T.dt])

            # Create moving average for vel and acc for the trajectory
            velAvg = [nVelAvg.update(vData.N.Vel), eVelAvg.update(vData.E.Vel), dVelAvg.update(vData.D.Vel)]
            accAvg = [nAccAvg.update(vData.N.Acc), eAccAvg.update(vData.E.Acc), dAccAvg.update(vData.D.Acc)]

            # Reset controller and generate new setpoint list whenever there is a mode switch
            if (vehicle.mode.name == 'STABILIZE'):
                modeState = 1

            if (vehicle.mode.name == 'GUIDED_NOGPS') and (modeState == 1):
                modeState = 0
                C.resetController()
                SP.update(actualPos, velAvg, accAvg)

            # Print data
            # print('N: {:<8.0f} E: {:<8.0f} D: {:<8.0f} Y: {:<8.1f}'.format(vData.N.Pos, vData.E.Pos, vData.D.Pos, vData.Y.Ang))
            # print('R: {:<8.2f} P: {:<8.2f} Y: {:<8.2f} r: {:<8.2f} p: {:<8.2f} y: {:<8.2f} t: {:<8.2f}'.format(roll, pitch, yaw, rollControl, pitchControl, yawControl, thrustControl))
            # print('N: {:<8.1f} {:<8.1f} {:<8.1f} E: {:<8.1f} {:<8.1f} {:<8.1f} D: {:<8.1f} {:<8.1f} {:<8.1f} Y: {:<8.1f} {:<8.1f}'.format(vData.N.Pos, vData.N.Vel, vData.N.Acc, vData.E.Pos, vData.E.Vel, vData.E.Acc, vData.D.Pos, vData.D.Vel, vData.D.Acc, vData.Y.Ang, vData.Y.Vel)) 
            # print('N: {:<8.1f} {:<8.1f} E: {:<8.1f} {:<8.1f} D: {:<8.1f} {:<8.1f} Y: {:<8.1f} {:<8.1f}'.format(vData.N.One, vData.N.Two, vData.E.One, vData.E.Two, vData.D.One, vData.D.Two, vData.Y.One, vData.Y.Two))

    except KeyboardInterrupt:
        # Print final remarks and close connections/threads
        print('Closing')
        s.close()
        
        # Record time stamp for data logs
        now = datetime.datetime.now()
        C.logData(now)
        
    finally:
        # Write data to a data frame
        df = pd.DataFrame(data, columns=['Mode', 'Time', 
                            'Freq', 'time2delay', 'actualDelay',
                            'North-Desired', 'East-Desired', 'Down-Desired',
                            'Roll-UAV', 'Pitch-UAV', 'Yaw-UAV',
                            'Roll-Control', 'Pitch-Control', 'Yaw-Control', 'Thrust-Control',
                            'North-Pos', 'East-Pos', 'Down-Pos', 'Yaw-Ang',
                            'North-Vel', 'East-Vel', 'Down-Vel', 'Yaw-Vel',
                            'North-Acc', 'East-Acc', 'Down-Acc', 
                            'North-Avg', 'East-Avg', 'Down-Avg', 'Yaw-Avg',
                            'North-Dif', 'East-Dif', 'Down-Dif', 'Yaw-Dif',
                            'North-One', 'East-One', 'Down-One', 'Yaw-One',
                            'North-Two', 'East-Two', 'Down-Two', 'Yaw-Two',
                            'Landing-State', 'Q-Size', 'Kalman-Time', 'Kalman-Dt'])
        
        # Print sampling rate
        print('Sampling Frequency: ' + '{:<4.2f} +/- {:<0.2f} '.format(df['Freq'].mean(), df['Freq'].std()))
        
        # Save data to CSV
        fileName = 'flightData/' + now.strftime('%Y-%m-%d__%H-%M-%S--MAIN') + '.csv'
        df.to_csv(fileName, index=None, header=True)
        print('Main log saved to: ' + fileName)

if __name__ == "__main__":
    main()
