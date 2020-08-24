from threading import Thread
import time
import struct
import serial

class SerialComs:
    def __init__(self, serialPort='/dev/ttyUSB*', serialBaud=9600):
        # Class / object / constructor setup
        self.port = serialPort
        self.baud = serialBaud
        self.isReceiving = False
        self.isRun = True
        self.thread = None
        self.byteOut = 0

        # Connect to serial port
        try:
            self.serialConnection = serial.Serial(serialPort, serialBaud, timeout=0)
            print('Connected to ' + str(serialPort) + ' at ' + str(serialBaud) + ' BAUD.')
        except:
            print('Failed to connect with ' + str(serialPort) + ' at ' + str(serialBaud) + ' BAUD.')

    def serialThreadStart(self):
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
        try:
            temp = self.serialConnection.read()
            self.byteOut = struct.unpack('B', temp)[0]
        except:
            print('Failed to read and unpack byte')

    def writeSerialData(self, msg):
        try:
            self.serialConnection.write(bytes([msg]))
        except:
            print('Failed to write byte')

    def close(self):
        # Close the serial port connection
        self.isRun = False
        self.thread.join()
        self.serialConnection.close()
        print('Disconnected from ' + str(self.port))

class QuickConnect:
    def __init__(self, s):
        # Payload protocal
        self.ENGAGE   = 0xFE
        self.RELEASE  = 0xFF

        # Payload states
        self.FLOATING = 0x0E
        self.READY    = 0x5A
        self.WAIT     = 0x5F
        self.EXIT     = 0xEE

        # Serial port class
        self.ser = s

    def engage(self):
        # Send the command to engage
        for _ in range(5):
            self.ser.writeSerialData(self.ENGAGE)
            time.sleep(1/15)

        # # Wait till ready command is received
        # while(self.ser.byteOut != self.READY):
        #     pass

        # # Acknowledge ready
        # self.ser.writeSerialData(self.READY)

    def release(self):
        # Send the command to engage
        for _ in range(5):
            self.ser.writeSerialData(self.RELEASE)
            time.sleep(1/15)

class CAP:
    def __init__(self, s):
        # ID
        self.ID = 0x01

        # Communcation protocal
        self.OPEN     = 0x0A
        self.CLOSE    = 0x0B
        self.CLAMPED  = 0x0C
        self.RELEASED = 0x0D
        self.FLOATING = 0x0E

        # Serial port class
        self.ser = s

    def openJaws(self):
        # Send ID
        self.ser.writeSerialData(self.ID)

        # Send open command
        self.ser.writeSerialData(self.OPEN)

        # Do something unitl released
        while(self.ser.byteOut != self.RELEASED):
            time.sleep(0.01)

    def closeJaws(self):
        # Send ID
        self.ser.writeSerialData(self.ID)

        # Send closed command
        self.ser.writeSerialData(self.CLOSE)

        # Do something until clamped
        while(self.ser.byteOut != self.CLAMPED):
            time.sleep(0.01)

def main():
    # Connect to serial port
    portName = '/dev/cu.wchusbserial1410'
    baudRate = 9600

    # Set up the class and start the serial port
    s = SerialComs(portName, baudRate)
    s.serialThreadStart()

    # Classes
    q = QuickConnect(s)
    c = CAP(s)

    # Run till quit
    while(True):
        state = input('What would you like to do? ')

        # Switch case options
        if state == 'q':
            break
        elif state == 'e':
            q.engage()
        elif state == 'r':
            q.release()
        elif state == 'o':
            c.openJaws()
        elif state == 'c':
            c.closeJaws()

        # Clear the data line
        s.writeSerialData(0xEE)

    # Close the serial port
    s.close()

# Main loop
if __name__ == '__main__':
	main()
