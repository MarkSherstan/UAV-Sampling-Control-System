from payloads import SerialComs, QuickConnect, CAP
from filter import MovingAverage, TimeSync
from dronekit import connect, VehicleMode
from pymavlink import mavutil
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

    # Speed up reading of RC channels
    msg = vehicle.message_factory.request_data_stream_encode(
        0, 0,
        mavutil.mavlink.MAV_DATA_STREAM_RC_CHANNELS,
        150, # Rate (Hz)
        1)   # Turn on
    vehicle.send_mavlink(msg)
    time.sleep(0.5)

    # Loop rate stabilization
    sync = TimeSync(1/50)
    sync.startTimer()

    # Connect to serial port and quick connect
    s = SerialComs()
    q = QuickConnect(s)
    c = CAP(s)
    
    # Engage 
    print('Engage quick conenct in 3 seconds')
    print('3')
    time.sleep(1) 
    print('2')
    time.sleep(1) 
    print('1')
    time.sleep(1) 

    q.engage()
    
    # Timers
    print('Start')
    sync.startTimer()

    # Run forever
    try:
        while(True):
            # Stabilize rate
            sleepTimer = time.time()
            time2delay = sync.stabilize()
            actualDelay = time.time() - sleepTimer
            
            # Monitor the switch
            state = vehicle.channels['7']
            
            if state > 1500:
                c.openJaws()
                print('Open jaws')
            elif state < 1000:
                c.closeJaws()
                print('Close jaws')
   
    except KeyboardInterrupt:
        # Print final remarks and close connections/threads
        print('Closing')
        s.close()
        
    finally:
        # Final comments 
        print('I hope it worked')

if __name__ == "__main__":
    main()