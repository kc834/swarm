#!/usr/bin/env python

import rospy
import geometry_msgs.msg
import argparse
import random
import std_msgs
from std_msgs.msg import ColorRGBA, Float32, Bool
from nav_msgs.msg import Odometry
import time
import math
import numpy
import ViconTrackerPoseHandler as vt
import sys

# collision avoidance
import swarmParams
from collisionFreeDecentralized import *

# declaring variables
# current speed
odometry = None

# offset speed
init_odom = None

# angle of speed
theta_cal=0

# Distance to walls, assuming room is a cube
wallRange = 5.0

# All possible matrices where 1st and 2nd wall can be negative or positive
MAP = numpy.matrix([[-wallRange,-wallRange,wallRange,-wallRange],[wallRange,-wallRange,wallRange,wallRange],[wallRange,wallRange,-wallRange,wallRange],[-wallRange,wallRange,-wallRange,-wallRange]])

def save_odometry(data):
    global odometry

    # If this is the first data input, save in init_odom
    if odometry is None:
        global init_odom

        # Set init_odom to position? [Probably a change in position type of deal]
        init_odom = data.pose.pose

    # Always change odometry to data.pose.pose
    odometry =data.pose.pose

#Define the waypoints to be visited and the speed at which to visit them
    # magnitude min 5 for lab ground
    # magnitude min 30 for lab carpet
    # magnitude min 150 for lab carpet with vicon tracker cup
#waypoints=numpy.array([ [1,1], [-1,1] ])

#loc_goal=[]
#loc_goal.append(1)
#loc_goal.append(1)

if __name__=="__main__":
    #parser = argparse.ArgumentParser(description="Test Sphero location")
    #args, unknown = parser.parse_known_args()

    #sys.argv = ["", sphero_name[0], sphero_name[1],...,sphero_name[n],
    # viconStartNumHere,viconBegin,viconEnd]
    viconStartNumHere = int(sys.argv[-3])
    viconBegin = int(sys.argv[-2])
    viconEnd = int(sys.argv[-1])

    # Offset from default ViconStart
    Diff = viconStartNumHere-1

    # Number of vicon thingymabobbers
    numAll = viconEnd-viconBegin+1

    # Number of spheros
    Num = len(sys.argv)-4

    # Initialize a list for efficient looping
    sphero_name = [[]]*Num

    # Make a new sphero_name array using sys.argv
    for i in range(Num):
        sphero_name[i] = 'sphero_'+str(sys.argv[i+1])

    # Make a bunch of variables equal other variables
    obj = swarmParams.sysParams(numAll)

    # Tis a 1
    odd = 1

    # Initial theta and radius
    theta0 = math.pi/6
    radius0 = 1.5

    # A waypoint is a place that the sphero will visit
    waypoints = [[]]*Num

    # Position each sphero equidistant from each other around a circle
    for i in range(Num):
        waypoints[i] = odd*radius0*numpy.array([ [math.cos(i*2*math.pi/Num+theta0),math.sin(i*2*math.pi/Num+theta0)] ])

    # neighborRadius = 10.0

    # (m,n) size of first waypoint array
    size_waypoints=waypoints[0].shape #[m,n] length and width of waypoints

    # Just m from above. Is m ever not 1 ?
    num_waypoints=size_waypoints[0] #first entry is length (width is 2-(x,y))

    # velocity magnitude, duh
    vel_mag=120

    # Initialize nodes
    rospy.init_node(sphero_name[0]+"_test_vel")

    # publish to topics

    # Initialize arrays for pub and color_pub
    pub = [[]]*Num
    color_pub = [[]]*Num

    # Publish a color and a velocity to each sphero
    for i in range(Num):
        pub[i] = rospy.Publisher(sphero_name[i]+'/cmd_vel', geometry_msgs.msg.Twist, queue_size=1, latch=True)
        color_pub[i] = rospy.Publisher(sphero_name[i] + '/set_color', ColorRGBA, queue_size=1, latch=True)

    # green and blue. we like green better.
    grn_color = std_msgs.msg.ColorRGBA(g=255)
    blu_color = std_msgs.msg.ColorRGBA(b=255)
    col_msg = grn_color

    # some bool
    flash_risingEdge = True

    rate = rospy.Rate(12) # set publish rate

    # subscribe to odometry data. Callback is invoked with the message as the
    # first argument.
    rospy.Subscriber(sphero_name[0]+'/odom', Odometry, callback=save_odometry)

    #Initialize the sphero as a vicon tracked object
    aVicon = [[]]*numAll
    bVicon = [[]]*Num

    # Tracks viconBegin+i
    for i in range(numAll):
        aVicon[i] = vt.ViconTrackerPoseHandler(None, None, "",viconBegin+i, 'Sphero'+str(i+1))

    # Tracks viconBegin+Diff+i
    for i in range(Num):
        bVicon[i] = vt.ViconTrackerPoseHandler(None, None, "",viconBegin+Diff+i, 'Sphero'+str(i+1+Diff))

    # Functions that I've never seen before
    obj.initPose()
    obj.goalPose()

    # Function that I thought was a variable
    obj.neighborRadius()

    # change goalPose to waypoints
    for i in range(Num):
        obj.goalPose[0,Diff+i] = waypoints[i][0,0]
        obj.goalPose[1,Diff+i] = waypoints[i][0,1]

    #Calibrate sphero frame

    sphero_theta = [0.0]*Num

    # I don't like this. It only moves one sphero at a time. We should swarm.
    for i in range(Num):

    	rate.sleep()

        # Check your watch
        startCalib = time.time()
        # Get your position
        init_calib_loc = bVicon[i].getPose()
        # I guess this is x and y
        print init_calib_loc[0]
        print init_calib_loc[1]
        # For one second
        while (time.time() - startCalib < 1):
            # Declare linear and angular velocities
            vel_msg = geometry_msgs.msg.Twist(geometry_msgs.msg.Vector3(100,0,0), \
                                              geometry_msgs.msg.Vector3(0,0,0))
            # Publish velocity data to the ith sphero
            pub[i].publish(vel_msg)
            rate.sleep()

        # Alright, stop! Hammertime!
        vel_msg = geometry_msgs.msg.Twist(geometry_msgs.msg.Vector3(0,0,0), \
                                              geometry_msgs.msg.Vector3(0,0,0))
        # It actually stops here
        pub[i].publish(vel_msg)
        rate.sleep()

        # Now use bVicon? But we were just using aVicon.
        fin_calib_loc = bVicon[i].getPose()
        print fin_calib_loc[0]
        print fin_calib_loc[1]

        # The calibration vector is found by using delta x and delta y
        calibVect = numpy.array([fin_calib_loc[0]-init_calib_loc[0],fin_calib_loc[1]-init_calib_loc[1]])
        print calibVect[0]
        print calibVect[1]

        # Calibration theta is just arctan (y/x)
        calib_theta = numpy.arctan2(calibVect[1],calibVect[0])

        # Set sphero_theta to calibration theta
        sphero_theta[i] = calib_theta

        # Print theta in degrees
        print "Sphero Theta is "+str(180/math.pi*sphero_theta[i])+"\n"

# Find location of all
locAll = [[]]*numAll
poseAll = numpy.zeros([2,numAll])

#loop through the goal points and move to all of them
for ind in range(0,num_waypoints):
#index of first goal is 0, last is num_waypoints-1
    #extract the current goal location
    # location of goal
    loc_goal=[[]]*Num
    # initial location
    loc_init=[[]]*Num
    # vector to goal
    vect2goal=[[]]*Num
    # distance to goal
    dist2goal=[[]]*Num
    rate.sleep()

    # for each sphero
    for i in range(Num):
        #loc_goal[i].append(waypoints[i][ind][0])
        #loc_goal[i].append(waypoints[i][ind][1])

        # store all the waypoints you want to visit
        loc_goal[i]=[waypoints[i][ind][0],waypoints[i][ind][1]]

        # store the initial positions
        loc_init[i]=bVicon[i].getPose()

        # Get vector from initial position to waypoint
        vect2goal[i] = numpy.array([(loc_goal[i][0]-loc_init[i][0]),(loc_goal[i][1]-loc_init[i][1])])

        # Find magnitude of vectorr
        dist2goal[i] = numpy.sqrt(vect2goal[i].dot(vect2goal[i]))

    # Total distance to goal for all spheros
    dist2goalAll = sum(dist2goal)

    # tik tok
    start = time.time()

    # Assume 0.1*(Num+2) is small enough that it's basically 0
    while (dist2goalAll > 0.1*(Num+2)): # not at goal point

        #
        for i in range(Num):

            # Make a 2x0 empty array
            statesNeighbor = numpy.array([]).reshape(2,0)

            # Make a 1x0 empty array
            indNeighbor = numpy.array([]).reshape(1,0)

            rate.sleep()

            for j in range(numAll):

                # Store positions of each of the spheros
                locAll[j] = aVicon[j].getPose()

                # Store positions as x coordinates in top vector and y in bottom
                poseAll[0,j] = locAll[j][0]
                poseAll[1,j] = locAll[j][1]

            for j in range(numAll):

                # As long as j isn't the next sphero
                if j!=i+Diff:

                    # Store all spheros up until j
                    statejTmp = numpy.array(numpy.matrix(poseAll)[:,j])

                    # Store all spheros up until i+Diff
                    stateiTmp = numpy.array(numpy.matrix(poseAll)[:,i+Diff])

                    # The norm finds the distance between two matrices. The
                    # condition of this if statement is "as long as the distance
                    # between two matrices is less than some predefined distance,
                    # defined in swarmParams"
                    if numpy.linalg.norm(statejTmp-stateiTmp) <= obj.Dneighbor[i+Diff]:

                        # Make a new list [statesNeighbor, statejTmp]
                        statesNeighbor = numpy.hstack([statesNeighbor,statejTmp])

                        # Make a new list [indNeighbor, numpy.array([[j]])]
                        indNeighbor = numpy.hstack([indNeighbor,numpy.array([[j]])])

            # Turn lists into matrices
            poseAll = numpy.matrix(poseAll)
            statesNeighbor = numpy.matrix(statesNeighbor)
            indNeighbor = numpy.matrix(indNeighbor)

            # get pose from swarmParams
            obj.getCurrentPose(poseAll)

            # find vector from current position to goal and distance per spheros
            vect2goal[i] = numpy.array([(loc_goal[i][0]-locAll[i+Diff][0]),(loc_goal[i][1]-locAll[i+Diff][1])])
            print "FUCK"
            print "FUCK"
            print "FUCK"
            print "FUCK"
            print "FUCK"
            print "FUCK"
            print "FUCK"
            print "FUCK"
            print "FUCK"
            print "FUCK"
            print "FUCK"
            print "FUCK"
            print "FUCK"
            print "FUCK"
            print "FUCK"
            print "FUCK"
            print "FUCK"
            print vect2goal[i]
            dist2goal[i] =  numpy.sqrt(vect2goal[i].dot(vect2goal[i]))

            #Calculate the required vel_msg to reach the goal point from the current location in the vicon frame

            # if too far
            if dist2goal[i] > 0.2:

                try:
                    v_vect_V_actual = actualController(poseAll[:,i+Diff],i+Diff,statesNeighbor,indNeighbor,obj,MAP)
                    print "actual_vel="
                    print v_vect_V_actual

                    v_vect_V_actual = numpy.array([[v_vect_V_actual[0]],[v_vect_V_actual[1]]])

                    thetaNew = numpy.arctan2((v_vect_V_actual[1]),(v_vect_V_actual[0]))
                    v_x_V_new = vel_mag*math.cos(thetaNew)
                    v_y_V_new = vel_mag*math.sin(thetaNew)
                    v_vect_V_update = numpy.array([[v_x_V_new],[v_y_V_new]])

                    print "actual_vel new is"
                    print v_vect_V_update

                    print "Position is"
                    print locAll[i+Diff]

                    R_SV=numpy.array([ [math.cos(sphero_theta[i]),math.sin(sphero_theta[i])],[-math.sin(sphero_theta[i]), math.cos(sphero_theta[i])] ])
        	       # convert global frame to sphero frame
                    v_vect_S=numpy.dot(R_SV,v_vect_V_update)
                    v_x_S=v_vect_S[0]
                    v_y_S=v_vect_S[1]

                # If error, set velocity to 0
                except ValueError:
                    v_x_S = 0
                    v_y_S = 0

                #Define the vel_msg command to send to the sphero

                #vel_msg = geometry_msgs.msg.Twist(geometry_msgs.msg.Vector3(v_vect_S[0],v_vect_S[1],0), \
                                              #geometry_msgs.msg.Vector3(0,0,0))
                vel_msg = geometry_msgs.msg.Twist(geometry_msgs.msg.Vector3(v_x_S,v_y_S,0), \
                                              	geometry_msgs.msg.Vector3(0,0,0))

            else:
                vel_msg = geometry_msgs.msg.Twist(geometry_msgs.msg.Vector3(0,0,0), \
                                                geometry_msgs.msg.Vector3(0,0,0))

            vel_msg_zero = geometry_msgs.msg.Twist(geometry_msgs.msg.Vector3(0,0,0), \
                                          	geometry_msgs.msg.Vector3(0,0,0))

            #rospy.loginfo("Velocity: {0}".format(vel_msg))
            '''if flash_risingEdge:
            	col_msg = grn_color
            	flash_risingEdge = False
            else:
            	col_msg = blu_color
            	flash_risingEdge = True'''

            pub[i].publish(vel_msg)
            color_pub[i].publish(col_msg)
            rate.sleep()

    	dist2goalAll = sum(dist2goal)


rospy.loginfo("Last Odometry: {0}".format(odometry))
rospy.loginfo("Last Odometry: {0}".format(odometry))
print locAll

for i in range(Num):
	color_pub[i].publish(grn_color)
