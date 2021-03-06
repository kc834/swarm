#!/usr/bin/env python

# I think this one is the most up to date version

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

    # sys.argv = sphero_name[0], sphero_name[1],...,sphero_name[n],
    # viconStartNumHere,viconBegin,viconEnd
    # Each sphero name is the color sequence

    # If using different terminals, start control from this port
    viconStartNumHere = int(sys.argv[-3])

    # First vicon port
    viconBegin = int(sys.argv[-2])

    # Last vicon port
    viconEnd = int(sys.argv[-1])

    # Offset from default ViconStart
    Diff = viconStartNumHere-1

    # Number of spheros total
    numAll = viconEnd-viconBegin+1

    # Number of spheros in this terminal
    Num = len(sys.argv)-4

    # Initialize a list for efficient looping
    sphero_name = [[]]*Num

    # Make a new sphero_name array using sys.argv
    for i in range(Num):
        sphero_name[i] = 'sphero_'+str(sys.argv[i+1])

    # Make a new sysParams object
    obj = swarmParams.sysParams(numAll)

    # This is a constant for positioning the sphero around the circle. Change to
    # -1 to see collision avoidance
    odd = 1

    # Initial angle offset
    theta0 = math.pi/6

    # Initialize radius
    radius0 = 1.5

    # A waypoint is a place that the sphero will visit
    waypoints = [[]]*Num

    # Position each sphero equidistant from each other around a circle
    for i in range(Num):
        waypoints[i] = numpy.array([ [0, 0] ])

    # neighborRadius = 10.0

    # (m,n) size of first waypoint array
    size_waypoints=waypoints[0].shape #[m,n] length and width of waypoints

    # The number of rows of the first waypoint array.
    num_waypoints=size_waypoints[0] #first entry is length (width is 2-(x,y))

    # velocity magnitude
    vel_mag=170

    # Initialize nodes
    rospy.init_node(sphero_name[0]+"_test_vel")

    # publish to topics

    # Initialize arrays for pub and color_pub
    pub = [[]]*Num
    color_pub = [[]]*Num

    # Publish a velocity and a color to each sphero
    for i in range(Num):
        pub[i] = rospy.Publisher(sphero_name[i]+'/cmd_vel', geometry_msgs.msg.Twist, queue_size=1, latch=True)
        color_pub[i] = rospy.Publisher(sphero_name[i] + '/set_color', ColorRGBA, queue_size=1, latch=True)

    # green and blue. we like green better.
    grn_color = std_msgs.msg.ColorRGBA(g=255)
    blu_color = std_msgs.msg.ColorRGBA(b=255)
    col_msg = grn_color

    # A boolean for debugging purposes
    # flash_risingEdge = True

    rate = rospy.Rate(12) # set publish rate to 1/12 of a second

    # subscribe to odometry data. Callback is invoked with the message as the
    # first argument.
    rospy.Subscriber(sphero_name[0]+'/odom', Odometry, callback=save_odometry)

    #Initialize the sphero as a vicon tracked object
    aVicon = [[]]*numAll
    bVicon = [[]]*Num

    # Tracks the very first sphero overall
    for i in range(numAll):
        aVicon[i] = vt.ViconTrackerPoseHandler(None, None, "",viconBegin+i, 'Sphero'+str(i+1))

    # Tracks the first sphero in this terminal
    for i in range(Num):
        bVicon[i] = vt.ViconTrackerPoseHandler(None, None, "",viconBegin+Diff+i, 'Sphero'+str(i+1+Diff))

    #print bVicon[0].getPose();
    #print bVicon[1].getPose();
    #print bVicon[2].getPose();

    # Get initial position, goal position, and neighbor radius
    obj.initPose()
    obj.goalPose()
    obj.neighborRadius()

    # change goalPose to waypoints
    #print Num
    for i in range(Num):
        #print Diff+i
        obj.goalPose[0,Diff+i] = waypoints[i][0,0]
        obj.goalPose[1,Diff+i] = waypoints[i][0,1]

    #Calibrate sphero frame

    sphero_theta = [0.0]*Num

    # The purpose of this for loop is to loop through all of the spheros and
    # publish a command to each of them to move at a velocity of 100 in the
    # positive x direction for one second. In a physical setting, the robot will
    # not move the perfect distance or at the perfect angle, so this loop will
    # change the initial calibration to make the robot move as intended.
    for i in range(Num):

    	rate.sleep()

        # Check your watch
        startCalib = time.time()
        # Get the intial position of the sphero
        init_calib_loc = bVicon[i].getPose()
        # Get the initial calibration location (x,y)
        #print init_calib_loc[0]
        #print init_calib_loc[1]
        # For one second
        while (time.time() - startCalib < 1):
            # Declare linear and angular velocities
            vel_msg = geometry_msgs.msg.Twist(geometry_msgs.msg.Vector3(100,0,0), \
                                              geometry_msgs.msg.Vector3(0,0,0))
            # Publish velocity data to the ith sphero
            pub[i].publish(vel_msg)
            rate.sleep()

        # Change the velocity message to stop movement
        vel_msg = geometry_msgs.msg.Twist(geometry_msgs.msg.Vector3(0,0,0), \
                                              geometry_msgs.msg.Vector3(0,0,0))
        # Publish zero velocity to spheros
        pub[i].publish(vel_msg)
        rate.sleep()

        # Get the final position of the sphero
        fin_calib_loc = bVicon[i].getPose()
        # Print the final calibration location (x,y)
        #print fin_calib_loc[0]
        #print fin_calib_loc[1]

        # The calibration vector is found by using delta x and delta y
        calibVect = numpy.array([fin_calib_loc[0]-init_calib_loc[0],fin_calib_loc[1]-init_calib_loc[1]])
        #print calibVect[0]
        #print calibVect[1]

        # Calibration theta is just arctan (y/x)
        calib_theta = numpy.arctan2(calibVect[1],calibVect[0])

        # Set sphero_theta to calibration theta
        sphero_theta[i] = calib_theta

        # Print theta in degrees
        #print "Sphero Theta is "+str(180/math.pi*sphero_theta[i])+"\n"

print fin_calib_loc

# Make empty arrays for storing the location of all spheros
locAll = [[]]*numAll
poseAll = numpy.zeros([2,numAll]) # Note this is an array

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

        # Find magnitude of vector
        dist2goal[i] = numpy.sqrt(vect2goal[i].dot(vect2goal[i]))

    # Total distance to goal for all spheros
    dist2goalAll = sum(dist2goal)

    # tik tok
    start = time.time()

    # The spheros of interest need to be close enough that this condition holds.
    # It calculates dist2goalAll. You're only moving a few spheros. dist2goalFew
    # should be so small that it drags down dist2goalAll to an acceptable level.
    # Assume 0.1*(Num+2) is small enough that it's basically 0

    # 2 x num array for tracking time changes
    timeList = time.time() * numpy.ones([2,numAll]) # Note this is an array
    velNum = numpy.zeros([2, Num])
    xOscill = 0
    yOscill = 0

    while (dist2goalAll > 0.1*(Num+2)): # not at goal point

        # For each sphero of interest
        for i in range(Num):

            # Make a 2x0 empty array. Will store the position of all the
            # neighboring spheros. Reset on each iteration.
            statesNeighbor = numpy.array([]).reshape(2,0)

            # Make a 1x0 empty array. WIll store the index of each neighbor
            # corresponding to a state in statesNeighbor. Reset on each iteration.
            indNeighbor = numpy.array([]).reshape(1,0)

            rate.sleep()

            # For all spheros.
            for j in range(numAll):

                # Store positions of each of the spheros
                locAll[j] = aVicon[j].getPose()

                # transpose locAll and store in poseAll
                poseAll[0,j] = locAll[j][0]
                poseAll[1,j] = locAll[j][1]

            # This part of the code checks if any of the spheros
            # may face an imminent collision with a sphero of interest. If they
            # do, then they are added to the list.
            for j in range(numAll):

                # As long as j isn't this sphero
                if j!=i+Diff:

                    # Get the position of the jth sphero. Checks every sphero.
                    statejTmp = numpy.array(numpy.matrix(poseAll)[:,j])

                    # Get the position of the i+Diff sphero. Only checks spheros
                    # of interest
                    stateiTmp = numpy.array(numpy.matrix(poseAll)[:,i+Diff])

                    # The norm finds the distance between two matrices. The
                    # condition of this if statement is "if the distance
                    # between two spheros is less than some predefined distance,
                    # defined in swarmParams"
                    if numpy.linalg.norm(statejTmp-stateiTmp) <= obj.Dneighbor[i+Diff]:

                        # Add this sphero's state to the list
                        statesNeighbor = numpy.hstack([statesNeighbor,statejTmp])

                        # Add this sphero's index to the list
                        indNeighbor = numpy.hstack([indNeighbor,numpy.array([[j]])])

                        # Find the distance fom the origin
                        dAbs = math.sqrt((poseAll[0,i+Diff])**2 + (poseAll[1,i+Diff])**2)

                        # Find the distances and angle between the two spheros
                        xDiff = poseAll[0,i+Diff] - poseAll[0,j]
                        yDiff = poseAll[1,i+Diff] - poseAll[1,j]
                        Di = math.sqrt(xDiff**2 + yDiff**2)
                        # phi = numpy.arctan2(yDiff/xDiff)

                        # Find the distance between this sphero's waypoint and
                        # the other sphero
                        xWaypoint = (loc_goal[i][0] - poseAll[0,j])
                        yWaypoint = (loc_goal[i][1] - poseAll[1,j])
                        DistColl = math.sqrt(xWaypoint**2 + yWaypoint**2)

                        # Within parking space
                        xProx = (poseAll[0,i+Diff] < 0.901671) or \
                            (poseAll[0,i+Diff] > -1.001163)
                        yProx = (poseAll[1,i+Diff] < 0.910718) or \
                            (poseAll[1,i+Diff] > -0.957385)
                        Prox = xProx and yProx

                        # Too far, turn back
                        xFar = (poseAll[0,i+Diff] > 0.901671) or \
                            (poseAll[0,i+Diff] < -1.001163)
                        yFar = (poseAll[1,i+Diff] > 0.910718) or \
                            (poseAll[1,i+Diff] < -0.957385)
                        Far = xFar or yFar

                        # If this sphero's waypoint is mad close to the other
                        # sphero and they're in the parking space

                        xNew = loc_goal[i][0]
                        yNew = loc_goal[i][1]

                        if ((DistColl <= 2 * obj.Ds) and Prox):

                            sF = obj.Ds/Di
                            # Change waypoint of the sphero
                            xNew = sF * poseAll[0,i+Diff] + (1 - sF) * poseAll[0,j]
                            yNew = sF * poseAll[1,i+Diff] + (1 - sF) * poseAll[1,j]

                            if (dAbs < min(0.046667 * numAll, 0.7)):

                                xNew = poseAll[0,i+Diff]
                                yNew = poseAll[1,i+Diff]

                        elif Far:

                            xNew = 0
                            yNew = 0

                        loc_goal[i][0] = xNew
                        loc_goal[i][1] = yNew

                        print loc_goal[i]

            # Turn lists into matrices
            poseAll = numpy.matrix(poseAll)
            statesNeighbor = numpy.matrix(statesNeighbor)
            indNeighbor = numpy.matrix(indNeighbor)

            # sets the pose of the object to poseAll. It's a bad name for a fxn.
            obj.getCurrentPose(poseAll)

            # find vector from current position to goal and distance per spheros
            vect2goal[i] = numpy.array([(loc_goal[i][0]-locAll[i+Diff][0]),(loc_goal[i][1]-locAll[i+Diff][1])])
            dist2goal[i] =  numpy.sqrt(vect2goal[i].dot(vect2goal[i]))

            #Calculate the required vel_msg to reach the goal point from the current location in the vicon frame

            # if too far
            if dist2goal[i] > 0.2:

                try:
                    # Get a new vector for the velocity to avoid collision
                    v_vect_V_actual = actualController(poseAll[:,i+Diff],i+Diff,statesNeighbor,indNeighbor,obj,MAP)

                    #print "actual_vel="
                    #print v_vect_V_actual

                    # Turn the velocity into an array
                    v_vect_V_actual = numpy.array([[v_vect_V_actual[0]],[v_vect_V_actual[1]]])

                    # Find the new angle
                    thetaNew = numpy.arctan2((v_vect_V_actual[1]),(v_vect_V_actual[0]))

                    # Redefine x and y velocities
                    v_x_V_new = vel_mag*math.cos(thetaNew) #velocity_x_Vicon
                    v_y_V_new = vel_mag*math.sin(thetaNew) #velocity_y_Vicon
                    v_vect_V_update = numpy.array([[v_x_V_new],[v_y_V_new]])

                    #print "actual_vel new is"
                    #print v_vect_V_update

                    #print "Position is"
                    #print locAll[i+Diff]

                    # Clockwise rotation matrix
                    R_SV=numpy.array([ [math.cos(sphero_theta[i]),math.sin(sphero_theta[i])],[-math.sin(sphero_theta[i]), math.cos(sphero_theta[i])] ])
        	        # convert global frame to sphero frame
                    # Note: numpy.dot is the same as matrix multiplication for 2D arrays
                    v_vect_S=numpy.dot(R_SV,v_vect_V_update)
                    v_x_S=v_vect_S[0]
                    v_y_S=v_vect_S[1]

                # If error, set velocity to 0
                except ValueError:
                    v_x_S = 0
                    v_y_S = 0

                #Define the vel_msg command to send to the sphero
                vel_msg = geometry_msgs.msg.Twist(geometry_msgs.msg.Vector3(v_x_S,v_y_S,0), \
                                              	geometry_msgs.msg.Vector3(0,0,0))

                #if ((velNum[0][i] > 0 and v_x_S < 0) or (velNum[0][i] < 0 and v_x_S > 0)):
                #    xOscill = xOscill + 1
                #if ((velNum[1][i] > 0 and v_y_S < 0) or (velNum[1][i] < 0 and v_y_S > 0)):
                #    yOscill = yOscill + 1
                velNum[0][i] = v_x_S
                velNum[1][i] = v_y_S

            else:
                vel_msg = geometry_msgs.msg.Twist(geometry_msgs.msg.Vector3(0,0,0), \
                                                geometry_msgs.msg.Vector3(0,0,0))
                velNum[0][i] = 0
                velNum[1][i] = 0

            vel_msg_zero = geometry_msgs.msg.Twist(geometry_msgs.msg.Vector3(0,0,0), \
                                          	geometry_msgs.msg.Vector3(0,0,0))

            #rospy.loginfo("Velocity: {0}".format(vel_msg))
            #if flash_risingEdge:
            #	col_msg = grn_color
            #	flash_risingEdge = False
            #else:
            #	col_msg = blu_color
            #	flash_risingEdge = True

            pub[i].publish(vel_msg)
            #print vel_msg
            #print "PUBLISH"
            color_pub[i].publish(col_msg)
            rate.sleep()

        # Calculate a new dist2goalAll. This is how the loop makes progress
        # towards termination.
    	dist2goalAll = sum(dist2goal)

rospy.loginfo("Last Odometry: {0}".format(odometry))
rospy.loginfo("Last Odometry: {0}".format(odometry))
#print locAll

for i in range(Num):
	color_pub[i].publish(grn_color)
