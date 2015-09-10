from sensors import sensor
import math
import jderobot
import cv2
import numpy as np


class MyAlgorithm():
    def __init__(self, sensor):
        self.sensor = sensor
        self.one=True


    def execute(self):
        # Add your code here
        '''
        tmp = self.sensor.getNavdata()
        if tmp!= None:
            print "State: " +str(tmp.state)
            print "Altitude: " +str(tmp.altd)
            print "Vehicle: " +str(tmp.vehicle)
            print "Battery %: " +str(tmp.batteryPercent)
        '''
        img = self.sensor.getImage();
        if img is not None:
            #print "Image dims: "+str(img.shape)
            #print "Image type: "+str(img.dtype)


            ## Emit a Q_SIGNAL with one argument (np.ndarray)
            #self.imgDisplay.Q_SLOT_ImageUpdate.emit(img)
            #@Deprecated
            self.debugImg(img)

    def debugImg(self, img): pass
    """ Decouple Qt SIGNAL by something like abstract function.
    You must override it with a lambda function that calls
    SIGNAL.emit(), or whatever, so it becomes like SLOT syntax
    via SIGNAL.connect(SLOT) but reversed:
    emitterFunct(x) = lambda(x): (SIGNAL.emit(x))
    """