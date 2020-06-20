from simdkalman.primitives import update, predict_observation, predict
import matplotlib.pyplot as plt
import pandas as pd
import numpy as np
import statistics
import simdkalman
import time

from filter import KalmanFilter, MovingAverage, Olympic

##########################
# Import data
##########################
fileName = '2020-06-18__20-52-05.csv' 
try:
    df = pd.read_csv(fileName, header = 0, names = ['Mode', 'Time', 'Freq',
                            'North-Vision',  'East-Vision',  'Down-Vision', 'Yaw-Vision',
                            'North-Desired', 'East-Desired', 'Down-Desired',
                            'Roll-UAV', 'Pitch-UAV', 'Yaw-UAV',
                            'Roll-Control', 'Pitch-Control', 'Yaw-Control', 'Thrust-Control'])
except:
    print('Error with file.')
    exit()

data = np.array(df['Yaw-Vision'])
data = data[0:100]

##########################
# ONLINE: Simulation
##########################

# Configure the filter
state_transition = np.array([[1,1],[0,1]])  # A
process_noise = np.diag([0.03, 0.001])      # Q: CHANGE THESE
observation_model = np.array([[1,0]])       # H
observation_noise = np.array([[100.0]])     # R: CHANGE THESE

# Initial state
m = np.array([0, 1])
P = np.eye(2)

# Create class instance 
inKF = KalmanFilter()
inMVG = MovingAverage(12)

outKF = KalmanFilter()
outMVG = MovingAverage(12)

bothKF = KalmanFilter()
inInMVG = MovingAverage(6)
outOutMVG = MovingAverage(6)

# oly = Olympic(6)

# Logging
filterIn = []
filterOut = []
filterBoth = []

kalmanRaw = []
movingAvg = []
olympicFilt = []

# Real time sim
for ii in range(data.size):
    raw = data[ii]
    
    # In 
    filterIn.append(inKF.update(inMVG.update(raw)))
    filterOut.append(outMVG.update(outKF.update(raw)))
    filterBoth.append(outOutMVG.update(bothKF.update(inInMVG.update(raw))))
    
    
    # Filter input 
    # kalmanRaw.append(yawKF.update(raw))
    # movingAvg.append(yawKF.update(mvg.update(raw)))
    # olympicFilt.append(yawKF.update(oly.update(raw)))
        

    # Filter Ouput
    # temp = yawKF.update(raw)
    # kalmanRaw.append(temp)
    # movingAvg.append(mvg.update(temp))
    # olympicFilt.append(oly.update(temp))
    
    
##########################
# Moving average calcs
##########################
# def movAvg(x, N):
#     # Return N-1 terms short (total length)
#     cumsum = np.cumsum(np.insert(x, 0, 0)) 
#     return (cumsum[N:] - cumsum[:-N]) / float(N)

# A = movAvg(meanList, 5)
# B = movAvg(data, 30)

##########################
# OFFLINE: Configure the Kalman Filter
##########################
# kf = simdkalman.KalmanFilter(
# state_transition = [[1,1],[0,1]],        # A
# process_noise = np.diag([0.05, 0.002]),  # Q
# observation_model = np.array([[1,0]]),   # H
# observation_noise = 20.0)                # R

# kf = kf.em(data, n_iter=10)

# Initial state
# m = np.array([0, 1])
# P = np.eye(2)

##########################
# Plot the data
##########################
t = range(data.size)
plt.plot(t, data, 'k-', alpha=0.2, label='Raw Data')
# plt.plot(t, kf.smooth(data).observations.mean, 'k.', label='Offline: Kalman Smoothed')
# plt.plot(t, kf.compute(data, 0, smoothed=False, filtered=True, initial_value = m, initial_covariance = P).filtered.observations.mean, 'k+', label='Offline: Kalman Filtered')
# plt.plot(t, kalmanRaw, 'k--', label='Kalman Filter')
# plt.plot(t, movingAvg, 'k-', label='Kalman w/ Low Pass Filter')
# plt.plot(t, olympicFilt, 'k-+', label='Kalman w/ Olympic Filter')

plt.plot(t, filterIn, 'k--', label='Filter In')
plt.plot(t, filterOut, 'k-+', label='Filter Out')
plt.plot(t, filterBoth, 'k-', label='Filter Both')

# plt.plot(range(A.size), A, 'k-', label='10 Point Moving Avg - Kalman')
# plt.plot(range(B.size), B, 'k--', label='30 Point Moving Avg')
plt.xlabel('Index')
plt.ylabel('Yaw [deg]')
plt.legend()
plt.show()
