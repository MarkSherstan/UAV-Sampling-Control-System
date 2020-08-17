from multiprocessing import Process, Queue
# from vision import Vision
from vision2 import Vision
import statistics
import time

def getVision(Q):
    # Vision Data
    temp = Q.get()
    posTemp = [temp[0], temp[1], temp[2]]
    velTemp = [temp[3], temp[4], temp[5]]
    psiTemp = [temp[6], temp[7]]
    return posTemp, velTemp, psiTemp

def main():
    # Connect to vision, create the queue, and start the core
    V = Vision()
    Q = Queue()
    P = Process(target=V.run, args=(Q, ))
    P.start()

    # Start timer
    loopTimer = time.time()
    freqList = []

    # Run forever unitl caught
    try:
        while(True):
            # Get vision data
            pos, vel, psi = getVision(Q)

            # Print data
            print('{:<8.1f} {:<8.1f} {:<8.1f}'.format(pos[0], pos[1], pos[2]))
            # print('{:<8.1f} {:<8.1f} {:<8.1f}'.format(vel[0], vel[1], vel[2]))
            # print('{:<8.1f} {:<8.1f}'.format(psi[0], psi[1]))

            # Print data
            freqLocal = (1 / (time.time() - loopTimer))
            freqList.append(freqLocal)
            loopTimer = time.time()

    except KeyboardInterrupt:
        # Print final remarks
        print('Closing Main!')
        print("Main average loop rate: ", round(statistics.mean(freqList),2), "+/-", round(statistics.stdev(freqList), 2))

        
if __name__ == "__main__":
    main()
