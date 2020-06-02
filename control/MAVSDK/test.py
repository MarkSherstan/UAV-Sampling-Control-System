import asyncio
import time 

from mavsdk import System
from mavsdk import (Attitude, AttitudeRate, OffboardError, Telemetry)

from controller import Controller


# Global storage variable
storage = []

async def getAttitude(drone):
    async for bodyAttitude in drone.telemetry.attitude_euler():
        return bodyAttitude.roll_deg, bodyAttitude.pitch_deg, bodyAttitude.yaw_deg

async def run():
    # Mac OS
    # drone = System()
    # await drone.connect(system_address="serial:///dev/cu.usbmodem14101:921600")

    # Linux
    drone = System(mavsdk_server_address='localhost', port=50051)
    await drone.connect()

    print("Waiting for drone to connect...")
    async for state in drone.core.connection_state():
        if state.is_connected:
            print(f"Drone discovered with UUID: {state.uuid}")
            break

    # Set initial set point for attitiude (required)
    await drone.offboard.set_attitude(Attitude(0.0, 0.0, 0.0, 0.0))
  
    # Connect to control scheme 
    C = Controller(250, 0, 0)
    C.startTime = time.time()
    
    # Start timer 
    timer = time.time()
    global storage
    
    while(True):
        # Send attitude command
        await drone.offboard.set_attitude(Attitude(0.0, 0.0, 0.0, 0.5))
        await drone.offboard.set_attitude_rate(AttitudeRate(0.0, 0.0, -45, 0.0))
        
        # print(drone.)

        time.sleep(1)

        await drone.offboard.set_attitude(Attitude(0.0, 0.0, 0.0, 0.5))
        await drone.offboard.set_attitude_rate(AttitudeRate(0.0, 0.0, 45, 0.0))

        time.sleep(1)

if __name__ == "__main__":
    loop = asyncio.get_event_loop()

    try:
        loop.run_until_complete(run())
    except KeyboardInterrupt:
        print("The end")    
        # print(storage)    