from sensors import sensor
import math
import jderobot
import cv2
import numpy as np
from gui.ImgDisplay import ImgDisplay


class MyAlgorithm():
    def __init__(self, sensor):
        self.sensor = sensor
        self.one=True
        self.imgDisplay = ImgDisplay()

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
            self.imgDisplay.Q_SLOT_ImageUpdate.emit(img)

