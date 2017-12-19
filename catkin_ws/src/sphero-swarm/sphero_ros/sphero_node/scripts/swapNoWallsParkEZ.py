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
import time

# collision avoidance
import swarmParams
from collisionFreeDecentralized import *

# declaring variables
# current speed
# odometry = None

# offset speed
# init_odom = None

# angle of speed
theta_cal=0

# Distance to walls, assuming room is a cube
wallRange = 5.0

# All possible matrices where 1st and 2nd wall can be negative or positive
MAP = numpy.matrix([[-wallRange,-wallRange,wallRange,-wallRange],[wallRange,-wallRange,wallRange,wallRange],[wallRange,wallRange,-wallRange,wallRange],[-wallRange,wallRange,-wallRange,-wallRange]])

# def save_odometry(data):
#     global odometry
#
#     # If this is the first data input, save in init_odom
#     if odometry is None:
#         global init_odom
#
#         # Set init_odom to position? [Probably a change in position type of deal]
#         init_odom = data.pose.pose
#
#     # Always change odometry to data.pose.pose
#     odometry =data.pose.pose

def parkControl(Region, row, loc):
    if Region == 1:
        # Do region 1 stuff
        temp = loc
        loc = row
        row = temp
        rowAdj = row
        locAdj = loc - 1
        rowAdjAdj = row
        locAdjAdj = loc - 2
    elif Region == 2:
        # Do region 2 stuff
        if row == 2:
            row = 0
        elif row == 0:
            row = 2
        temp = loc
        loc = row
        row = temp
        rowAdj = row
        locAdj = loc + 1
        rowAdjAdj = row
        locAdjAdj = loc + 2
    elif Region == 3:
        # Do region 3 stuff
        rowAdj = row - 1
        locAdj = loc
        rowAdjAdj = row - 2
        locAdjAdj = loc
    elif Region == 4:
        # Do region 4 stuff
        if row == 2:
            row = 0
        elif row == 0:
            row = 2
        rowAdj = row + 1
        locAdj = loc
        rowAdjAdj = row + 2
        locAdjAdj = loc
    else:
        print "undefined region"
        sys.exit(0)
    return [row, loc, rowAdj, locAdj, rowAdjAdj, locAdjAdj]

def moveGood(bVicon, v_x_V_new, v_y_V_new, i):
    startTime = time.time()
    print "stalling at i = " + str(i)
    print v_x_V_new
    print v_y_V_new
    while time.time() - startTime < 40:
        # Get your position
        init_calib_loc = bVicon[i].getPose()
        # I guess this is x and y
        time.sleep(0.2)

        fin_calib_loc = bVicon[i].getPose()

        calibVect = numpy.array([fin_calib_loc[0]-init_calib_loc[0],fin_calib_loc[1]-init_calib_loc[1]])
        labVel = numpy.linalg.norm(calibVect)


        if v_x_V_new > 0 or v_y_V_new > 0:
            if labVel > 0.005:
                if v_x_V_new > 0 and fin_calib_loc[0] - init_calib_loc[0] > 0:
                    if v_y_V_new > 0 and fin_calib_loc[1] - init_calib_loc[1] > 0:
                        return True
                if v_x_V_new > 0 and fin_calib_loc[0] - init_calib_loc[0] > 0:
                    if v_y_V_new < 0 and fin_calib_loc[1] - init_calib_loc[1] < 0:
                        return True
                if v_x_V_new < 0 and fin_calib_loc[0] - init_calib_loc[0] < 0:
                    if v_y_V_new > 0 and fin_calib_loc[1] - init_calib_loc[1] > 0:
                        return True
                if v_x_V_new < 0 and fin_calib_loc[0] - init_calib_loc[0] < 0:
                    if v_y_V_new < 0 and fin_calib_loc[1] - init_calib_loc[1] < 0:
                        return True

        else:
                if labVel < 0.005:
                    return True
    return False

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

    # Initial theta and radius
    theta0 = math.pi/6
    radius0 = 1.5

    # A waypoint is a place that the sphero will visit
    waypoints = [[]]*Num
    # short for metaWaypoints
    mW = numpy.array([[0, 0, 0], [0, 0, 0], [0, 0, 0]])

    # short for step. commonly used variable when determining location.
    s = obj.Ds

    park = numpy.array([ [ [s,5*s, -1] , [3*s,5*s, -1] , [5*s, 5*s, -1] ],
                         [ [s,3*s, -1] , [3*s,3*s, -1] , [5*s, 3*s, -1] ],
                         [ [s,  s, -1] , [3*s,  s, -1] , [5*s,   s, -1] ] ])

    # Position each sphero equidistant from each other around a circle
    for i in range(Num):
        waypoints[i] = numpy.array([ [3 * s, 3 * s] ])

    # neighborRadius = 10.0

    # (m,n) size of first waypoint array
    size_waypoints=waypoints[0].shape #[m,n] length and width of waypoints

    # Just m from above. Is m ever not 1 ?
    num_waypoints=size_waypoints[0] #first entry is length (width is 2-(x,y))

    # velocity magnitude, duh
    vel_mag=50

    # Initialize nodes
    rospy.init_node(sphero_name[0]+"_test_vel")

    # publish to topics

    # Initialize arrays for pub and color_pub
    pub = [[]]*Num
    sub = [[]]*Num
    color_pub = [[]]*Num

    # Publish a color and a velocity to each sphero
    for i in range(Num):
        pub[i] = rospy.Publisher(sphero_name[i]+'/cmd_vel', geometry_msgs.msg.Twist, queue_size=1, latch=True, tcp_nodelay=True)
        color_pub[i] = rospy.Publisher(sphero_name[i] + '/set_color', ColorRGBA, queue_size=1, latch=True, tcp_nodelay=True)

    # green and blue. we like green better.
    grn_color = std_msgs.msg.ColorRGBA(g=255)
    blu_color = std_msgs.msg.ColorRGBA(b=255)
    col_msg = grn_color

    # some bool
    flash_risingEdge = True

    rate = rospy.Rate(12) # set publish rate

    # subscribe to odometry data. Callback is invoked with the message as the
    # first argument.
    # rospy.Subscriber(sphero_name[0]+'/odom', Odometry, callback=save_odometry)

    #Initialize the sphero as a vicon tracked object
    aVicon = [[]]*numAll
    bVicon = [[]]*Num

    # Tracks the very first sphero overall
    for i in range(numAll):
        aVicon[i] = vt.ViconTrackerPoseHandler(None, None, "",viconBegin+i, 'Sphero'+str(i+1))

    # Tracks the first sphero in this terminal
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
    velNum = [60, 160, 160, 160, 60, 160, 60, 60, 60]
    velMin = [[]]*Num

    print "test"
    for i in range(Num):
        # Get your position
        init_calib_loc = bVicon[i].getPose()
        # I guess this is x and y
        print init_calib_loc[0]
        print init_calib_loc[1]
    # I don't like this. It only moves one sphero at a time. We should swarm.
    for i in range(Num):
        rate.sleep()
        veltmp = velNum[i] - 10
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
                rate.sleep()

            # Change the velocity message to stop movement
            vel_msg = geometry_msgs.msg.Twist(geometry_msgs.msg.Vector3(0,0,0), \
                                                      geometry_msgs.msg.Vector3(0,0,0))
            # Publish zero velocity to spheros
            pub[i].publish(vel_msg)
            rate.sleep()

            time.sleep(Num * 2)
            # Get the final position of the sphero
            fin_calib_loc = bVicon[i].getPose()
            # The calibration vector is found by using delta x and delta y
            calibVect = numpy.array([fin_calib_loc[0]-init_calib_loc[0],fin_calib_loc[1]-init_calib_loc[1]])
            labVel = numpy.linalg.norm(calibVect)

        print "I IS " + str(i)
        print "VELTEMP IS " + str(veltmp)

        velMin[i] = veltmp - 10
        # Calibration theta is just arctan (y/x)
        calib_theta = numpy.arctan2(calibVect[1],calibVect[0])

        # Set sphero_theta to calibration theta
        sphero_theta[i] = calib_theta
        velNum[i] = 1.4 * veltmp

    # Find location of all
    locAll = [[]]*numAll
    poseAll = numpy.zeros([2,numAll])

    defaultTime = time.time()
    delay = [defaultTime for x in range(Num)]

    moveVect = [1 for x in range(Num)]
    reach = [0 for x in range(Num)]

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

        thetaNew = [0 for x in range(Num)]

        mG = True

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

                        # Get the position of the jth sphero. Checks every sphero.
                        statejTmp = numpy.array(numpy.matrix(poseAll)[:,j])

                        # Get the position of the i+Diff sphero. Only checks spheros
                        # of interest
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

                # Parking algorithm

                leftWall = 0
                rightWall = 6 * s
                bottomWall = 0
                topWall = 6 * s

                xMin = leftWall - 3 * obj.Ds
                yMin = bottomWall - 3 * obj.Ds
                xMax = rightWall + 3 * obj.Ds
                yMax = topWall + 3 * obj.Ds

                Region = 0;

                if poseAll[0,i+Diff] > xMin and poseAll[0,i+Diff] < leftWall:
                    if poseAll[1,i+Diff] > yMin and poseAll[1,i+Diff] < yMax:
                        Region = 1
                        # row0 = [mW[0][0], mW[1][0], mW[2][0]]
                        # row1 = [mW[0][1], mW[1][1], mW[2][1]]
                        # row2 = [mW[0][2], mW[1][2], mW[2][2]]
                        mWNew = mW.transpose()
                if poseAll[0,i+Diff] > rightWall and poseAll[0,i+Diff] < xMax:
                    if poseAll[1,i+Diff] > yMin and poseAll[1,i+Diff] < yMax:
                        Region = 2
                        # row0 = [mW[0][2], mW[1][2], mW[2][2]]
                        # row1 = [mW[0][1], mW[1][1], mW[2][1]]
                        # row2 = [mW[0][0], mW[1][0], mW[2][0]]
                        mWNew = numpy.flipud(mW.transpose())
                if poseAll[0,i+Diff] > leftWall and poseAll[0,i+Diff] < rightWall:
                     if poseAll[1,i+Diff] > topWall and poseAll[1,i+Diff] < yMax:
                         Region = 3
                         # row0 = [mW[0][0], mW[0][1], mW[0][2]]
                         # row1 = [mW[1][0], mW[1][1], mW[1][2]]
                         # row2 = [mW[2][0], mW[2][1], mW[2][2]]
                         mWNew = mW
                if poseAll[0,i+Diff] > leftWall and poseAll[0,i+Diff] < rightWall:
                    if poseAll[1,i+Diff] > yMin and poseAll[1,i+Diff] < bottomWall:
                        Region = 4
                        # row0 = [mW[2][0], mW[2][1], mW[2][2]]
                        # row1 = [mW[1][0], mW[1][1], mW[1][2]]
                        # row2 = [mW[0][0], mW[0][1], mW[0][2]]
                        mWNew = numpy.flipud(mW)

                if poseAll[0,i+Diff] > leftWall and poseAll[0,i+Diff] < rightWall:
                    if poseAll[1,i+Diff] > bottomWall and poseAll[1,i+Diff] < topWall:
                        Region = 5

                if Region == 5 and delay[i] == defaultTime and moveVect[i] != 0:
                    for k in range(Num):
                        if i != k:
                            moveVect[k] = 0
                    delay[i] = time.time()
                    currentWay = numpy.linalg.norm([ loc_goal[i][0] - poseAll[0,i+Diff], loc_goal[i][1] - poseAll[1,i+Diff]])
                    vel_msg_zero = geometry_msgs.msg.Twist(geometry_msgs.msg.Vector3(0,0,0), \
                                                  	geometry_msgs.msg.Vector3(0,0,0))
                    pub[i].publish(vel_msg_zero)
                    rate.sleep()
                    for i in range(3):
                        for k in park[i]:
                            dist = numpy.linalg.norm([ k[0] - poseAll[0,i+Diff], k[1] - poseAll[1,i+Diff]])
                            if dist == currentWay:
                                row = i
                                col = k
                            if dist < currentWay:
                                currentWay = dist
                                obj.goalPose[0,Diff+i] = k[0]
                                obj.goalPose[1,Diff+i] = k[1]
                                row = i
                                col = k
                    mW[row][col] = 1

                if 4 >= Region >= 1 and delay[i] == defaultTime and moveVect[i] != 0:
                    vel_msg_zero = geometry_msgs.msg.Twist(geometry_msgs.msg.Vector3(0,0,0), \
                                                  	geometry_msgs.msg.Vector3(0,0,0))
                    pub[i].publish(vel_msg_zero)
                    rate.sleep()
                    for k in range(Num):
                        if i != k:
                            moveVect[k] = 0
                    delay[i] = time.time()
                    print "region recognized"
                    #stop the sphero
                    #check the metaList for parking
                    #If parking available in adjacent cells

                    if 0 in mWNew[0]:
                        row0 = (mWNew[0]).tolist()
                        loc = row0.index(0)
                        rowInit = 0
                        # switch back to meta frame
                        [row, loc, rowAdj, locAdj, rowAdjAdj, locAdjAdj] = parkControl(Region, rowInit, loc)
                        #Change waypoint to first available cell
                        loc_goal[i][0] = park[row][loc][0]
                        loc_goal[i][1] = park[row][loc][1]
                        obj.goalPose[0,Diff+i] = loc_goal[i][0]
                        obj.goalPose[1,Diff+i] = loc_goal[i][1]
                        park[row][loc][2] = i
                    #If parking not available in adjacent cells
                    else:
                        # check the next row of cells for vacancies
                        # if vacancy
                        if 0 in mWNew[1]:
                            row1 = (mWNew[1]).tolist()
                            loc = row1.index(0)
                            rowInit = 1
                            # switch back to meta frame
                            [row, loc, rowAdj, locAdj, rowAdjAdj, locAdjAdj] = parkControl(Region, rowInit, loc)
                            # Move the adjacent bot in row 1 to row 2
                            botIndex = int(park[rowAdj][locAdj][2])
                            # PRETEND THAT I = J
                            loc_goal[botIndex][0] = park[row][loc][0]
                            loc_goal[botIndex][1] = park[row][loc][1]
                            obj.goalPose[0,Diff+botIndex] = loc_goal[botIndex][0]
                            obj.goalPose[1,Diff+botIndex] = loc_goal[botIndex][1]
                            park[row][loc][2] = botIndex
                            moveVect[botIndex] = 1
                            reach[botIndex] = 0
                            # Change waypoint of first bot to row 1 cell
                            loc_goal[i][0] = park[rowAdj][locAdj][0]
                            loc_goal[i][1] = park[rowAdj][locAdj][1]
                            obj.goalPose[0,Diff+i] = loc_goal[i][0]
                            obj.goalPose[1,Diff+i] = loc_goal[i][1]
                            park[rowAdj][locAdj][2] = i
                            moveVect[i] = 0.01 * rowInit
                        #If this is full too
                        else:
                            # check the next row of cells for vacancies
                            # if vacancy
                            if 0 in mWNew[2]:
                                row2 = (mWNew[2]).tolist()
                                loc = row2.index(0)
                                rowInit = 2
                                # switch back to meta frame
                                [row, loc, rowAdj, locAdj, rowAdjAdj, locAdjAdj] = parkControl(Region, rowInit, loc)
                                # Move the adjacent bot in row 2 to row 3
                                botIndex = int(park[rowAdj][locAdj][2])
                                # PRETEND THAT I = J
                                loc_goal[botIndex][0] = park[row][loc][0]
                                loc_goal[botIndex][1] = park[row][loc][1]
                                obj.goalPose[0,Diff+botIndex] = loc_goal[botIndex][0]
                                obj.goalPose[1,Diff+botIndex] = loc_goal[botIndex][1]
                                park[row][loc][2] = botIndex
                                moveVect[botIndex] = 1
                                reach[botIndex] = 0
                                # Move the adjacent bot in row 1 to row 2
                                botIndex = park[rowAdjAdj][locAdjAdj][2]
                                # PRETEND THAT I = J
                                loc_goal[botIndex][0] = park[rowAdj][locAdj][0]
                                loc_goal[botIndex][1] = park[rowAdj][locAdj][1]
                                obj.goalPose[0,Diff+botIndex] = loc_goal[botIndex][0]
                                obj.goalPose[1,Diff+botIndex] = loc_goal[botIndex][1]
                                park[rowAdj][locAdj][2] = botIndex
                                moveVect[botIndex] = 0.01 * rowInit
                                reach[botIndex] = 0
                                # Change waypoint of first bot to row 1 cell
                                loc_goal[i][0] = park[rowAdjAdj][locAdjAdj][0]
                                loc_goal[i][1] = park[rowAdjAdj][locAdjAdj][1]
                                obj.goalPose[0,Diff+i] = loc_goal[i][0]
                                obj.goalPose[1,Diff+i] = loc_goal[i][1]
                                park[rowAdjAdj][locAdjAdj][2] = i
                                moveVect[i] = 0.01 * (rowInit - 1)
                            else:
                                print "Parking Space Full"
                                sys.exit(0)

                    print "shit happened"
                    mW[row][loc] = 1
                    # Start moving again

                # Turn lists into matrices
                poseAll = numpy.matrix(poseAll)
                statesNeighbor = numpy.matrix(statesNeighbor)
                indNeighbor = numpy.matrix(indNeighbor)

                # set pose in swarmParams
                obj.getCurrentPose(poseAll)

                # find vector from current position to goal and distance per spheros
                vect2goal[i] = numpy.array([(loc_goal[i][0]-locAll[i+Diff][0]),(loc_goal[i][1]-locAll[i+Diff][1])])
                print "=============================="
                print "I IS " + str(i)
                print "=============================="
                print "The Region is " + str(Region)
                print Region
                print loc_goal[i]
                print obj.goalPose[0,Diff+i]
                print obj.goalPose[1,Diff+i]
                print moveVect
                dist2goal[i] =  numpy.sqrt(vect2goal[i].dot(vect2goal[i]))
                print "DISTANCE TO GOAL IS " + str(dist2goal[i])

                #Calculate the required vel_msg to reach the goal point from the current location in the vicon frame

                # if too far
                if dist2goal[i] > 0.2:

                    try:
                        # No collision avoidance once the bot is inside the parking area
                        if Region != 5:
                            print obj.goalPose[0,Diff+i]
                            print obj.goalPose[1,Diff+i]

                            thetaOld = thetaNew[i]

                            v_vect_V_actual = actualController(poseAll[:,i+Diff],i+Diff,statesNeighbor,indNeighbor,obj,MAP)
                            print "actual_vel="
                            print v_vect_V_actual

                            v_vect_V_actual = numpy.array([[v_vect_V_actual[0]],[v_vect_V_actual[1]]])

                            thetaNew[i] = numpy.arctan2((v_vect_V_actual[1]),(v_vect_V_actual[0]))

                            if thetaOld != 0 and thetaNew[i] != thetaOld:
                                v_x_V_new = 0.9 * moveVect[i] * velNum[i] * math.cos(thetaNew[i])
                                v_y_V_new = 0.9 * moveVect[i] * velNum[i] * math.sin(thetaNew[i])
                            else:
                                v_x_V_new = moveVect[i] * velNum[i] * math.cos(thetaNew[i])
                                v_y_V_new = moveVect[i] * velNum[i] * math.sin(thetaNew[i])

                            print moveVect[i]
                            print velNum[i]

                            v_vect_V_update = numpy.array([[v_x_V_new],[v_y_V_new]])

                            print "actual_vel new is"
                            print v_vect_V_update

                            print obj.goalPose[0,Diff+i]
                            print obj.goalPose[1,Diff+i]

                            print "Position is"
                            print locAll[i+Diff]

                            R_SV=numpy.array([ [math.cos(sphero_theta[i]),math.sin(sphero_theta[i])],[-math.sin(sphero_theta[i]), math.cos(sphero_theta[i])] ])
                            # convert global frame to sphero frame
                            v_vect_S=numpy.dot(R_SV,v_vect_V_update)
                            v_x_S=v_vect_S[0]
                            v_y_S=v_vect_S[1]

                            print v_x_S
                            print v_y_S
                        else:
                            print obj.goalPose[0,Diff+i]
                            print obj.goalPose[1,Diff+i]

                            thetaOld = thetaNew[i]

                            thetaNew[i] = numpy.arctan2((loc_goal[i][1]-locAll[i+Diff][1]), (loc_goal[i][0]-locAll[i+Diff][0]))

                            v_x_V_new = 0.9 * moveVect[i] * velNum[i] * math.cos(thetaNew[i])
                            v_y_V_new = 0.9 * moveVect[i] * velNum[i] * math.sin(thetaNew[i])

                            print moveVect[i]
                            print velNum[i]

                            v_vect_V_update = numpy.array([[v_x_V_new],[v_y_V_new]])

                            print "actual_vel new is"
                            print v_vect_V_update

                            print obj.goalPose[0,Diff+i]
                            print obj.goalPose[1,Diff+i]

                            print "Position is"
                            print locAll[i+Diff]

                            R_SV=numpy.array([ [math.cos(sphero_theta[i]),math.sin(sphero_theta[i])],[-math.sin(sphero_theta[i]), math.cos(sphero_theta[i])] ])
                            # convert global frame to sphero frame
                            v_vect_S=numpy.dot(R_SV,v_vect_V_update)
                            v_x_S=v_vect_S[0]
                            v_y_S=v_vect_S[1]

                            print v_x_S
                            print v_y_S

                    # If error, set velocity to 0
                    except ValueError:
                        v_x_S = 0
                        v_y_S = 0

                    #Define the vel_msg command to send to the sphero

                    #vel_msg = geometry_msgs.msg.Twist(geometry_msgs.msg.Vector3(v_vect_S[0],v_vect_S[1],0), \
                                                  #geometry_msgs.msg.Vector3(0,0,0))
                    vel_msg = geometry_msgs.msg.Twist(geometry_msgs.msg.Vector3(v_x_S,v_y_S,0), \
                                                  	geometry_msgs.msg.Vector3(0,0,0))
                    vel_msg_zero = geometry_msgs.msg.Twist(geometry_msgs.msg.Vector3(0,0,0), \
                                                  	geometry_msgs.msg.Vector3(0,0,0))
                    print time.time() - delay[i]
                    if time.time() - delay[i] > 0.01:
                        pub[i].publish(vel_msg)
                        color_pub[i].publish(col_msg)
                        if mG == True and (v_x_V_new != 0 or v_y_V_new != 0) and moveVect[i] == 1:
                            # Sleep with latency correction
                            mG = moveGood(bVicon, v_x_V_new, v_y_V_new, i)
                        else:
                            mG = True
                        time.sleep(0.3)
                    else:
                        pub[i].publish(vel_msg_zero)
                    rate.sleep()

                # The robot has reached its destination
                else:
                    vel_msg = geometry_msgs.msg.Twist(geometry_msgs.msg.Vector3(0,0,0), \
                                                    geometry_msgs.msg.Vector3(0,0,0))
                    pub[i].publish(vel_msg)
                    rate.sleep()
                    if reach[i] == 0:
                        time.sleep(Num * 2)
                        locAll[i+Diff] = aVicon[i+Diff].getPose()
                        vect2goal[i] = numpy.array([(loc_goal[i][0]-locAll[i+Diff][0]),(loc_goal[i][1]-locAll[i+Diff][1])])
                        dist2goal[i] =  numpy.sqrt(vect2goal[i].dot(vect2goal[i]))
                    if dist2goal[i] > 0.2:
                            velNum[i] = 0.95 * velNum[i]
                    # This may cause bugs. Take caution.
                    elif moveVect[i] == 1:
                        reach[i] = 1
                        reset = True
                        rearrange = False
                        for k in range(Num):
                            if i != k and moveVect[k] != 0:
                                reset = False
                            if i != k and 1 > moveVect[k] > 0:
                                rearrange = True
                        # This is the only sphero that is movinf
                        if reset == True:
                            moveVect = [1 for x in range(Num)]
                        # Spheros are parking
                        elif rearrange == True:
                            # Stop the current sphero
                            moveVect[i] = 0
                            # Find the index of the next bot that we wish to move
                            nextBot = moveVect.index(max(moveVect))
                            print "nextBot"
                            print nextBot
                            # Start moving that bot
                            moveVect[nextBot] = 1
                            print moveVect
                        # Else, all spheros are moving. Do nothing.

                #rospy.loginfo("Velocity: {0}".format(vel_msg))
                '''if flash_risingEdge:
                	col_msg = grn_color
                	flash_risingEdge = False
                else:
                	col_msg = blu_color
                	flash_risingEdge = True'''

        	dist2goalAll = sum(dist2goal)


    # rospy.loginfo("Last Odometry: {0}".format(odometry))
    # rospy.loginfo("Last Odometry: {0}".format(odometry))
    print mW
    print park
    print locAll

    for i in range(Num):
    	color_pub[i].publish(grn_color)
