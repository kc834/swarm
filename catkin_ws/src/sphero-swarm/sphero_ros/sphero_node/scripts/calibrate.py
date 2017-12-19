import rospy
import geometry_msgs.msg
import argparse
import random
import std_msgs
from std_msgs.msg import ColorRGBA, Float32, Bool
from nav_msgs.msg import Odometry
import numpy as np
import time

def calibrate(Num, vel_mag, bVicon, pub, sphero_theta, velNum):
    for i in range(Num):
        rate.sleep()
        veltmp = vel_mag - 10
        calibVect = numpy.array([0,0])
        labVel = numpy.linalg.norm(calibVect)

        while labVel < 0.05:
            print i
            veltmp = veltmp + 10
            # Start time
            startCalib = time.time()
            # Initial Location
            init_calib_loc = bVicon[i].getPose()
            # For one second
            while (time.time() - startCalib < 1):
                # Declare linear and angular velocities
                vel_msg = geometry_msgs.msg.Twist(geometry_msgs.msg.Vector3(veltmp,0,0), \
                                                      geometry_msgs.msg.Vector3(0,0,0))
                # Publish velocity data to the ith sphero
                pub[i].publish(vel_msg)
                time.sleep(Num)
            # Change the velocity message to stop movement
            vel_msg = geometry_msgs.msg.Twist(geometry_msgs.msg.Vector3(0,0,0), \
                                                      geometry_msgs.msg.Vector3(0,0,0))
            # Publish zero velocity to spheros
            pub[i].publish(vel_msg)

            # Get the final position of the sphero
            fin_calib_loc = bVicon[i].getPose()
            # The calibration vector is found by using delta x and delta y
            calibVect = numpy.array([fin_calib_loc[0]-init_calib_loc[0],fin_calib_loc[1]-init_calib_loc[1]])
            labVel = numpy.linalg.norm(calibVect)

        print "I IS " + str(i)
        print "VELTEMP IS " + str(veltmp)

        # Calibration theta is just arctan (y/x)
        calib_theta = numpy.arctan2(calibVect[1],calibVect[0])

        # Set sphero_theta to calibration theta
        sphero_theta[i] = calib_theta
        velScale = 0.1/labVel
        velNum[i] = velScale * 10 + veltmp - 10
        time.sleep(2 * Num)

    return sphero_theta, velNum

def calibrate(Num, vel_mag, bVicon, pub, velNum):
    for i in range(Num):
        rate.sleep()
        veltmp = vel_mag - 10
        calibVect = numpy.array([0,0])
        labVel = numpy.linalg.norm(calibVect)

        while labVel < 0.05:
            print i
            veltmp = veltmp + 10
            # Start time
            startCalib = time.time()
            # Initial Location
            init_calib_loc = bVicon[i].getPose()
            # For one second
            while (time.time() - startCalib < 1):
                # Declare linear and angular velocities
                vel_msg = geometry_msgs.msg.Twist(geometry_msgs.msg.Vector3(veltmp,0,0), \
                                                      geometry_msgs.msg.Vector3(0,0,0))
                # Publish velocity data to the ith sphero
                pub[i].publish(vel_msg)
                time.sleep(Num)
            # Change the velocity message to stop movement
            vel_msg = geometry_msgs.msg.Twist(geometry_msgs.msg.Vector3(0,0,0), \
                                                      geometry_msgs.msg.Vector3(0,0,0))
            # Publish zero velocity to spheros
            pub[i].publish(vel_msg)

            # Get the final position of the sphero
            fin_calib_loc = bVicon[i].getPose()
            # The calibration vector is found by using delta x and delta y
            calibVect = numpy.array([fin_calib_loc[0]-init_calib_loc[0],fin_calib_loc[1]-init_calib_loc[1]])
            labVel = numpy.linalg.norm(calibVect)

        print "I IS " + str(i)
        print "VELTEMP IS " + str(veltmp)

        # Calibration theta is just arctan (y/x)
        calib_theta = numpy.arctan2(calibVect[1],calibVect[0])

        # Set sphero_theta to calibration theta
        sphero_theta[i] = calib_theta
        velScale = 0.1/labVel
        velNum[i] = velScale * 10 + veltmp - 10
        time.sleep(2 * Num)

    return velNum

if __name__=="__main__":
    return calibrate()
