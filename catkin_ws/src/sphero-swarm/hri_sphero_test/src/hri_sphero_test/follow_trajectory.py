#!/usr/bin/env python

import rospy
import geometry_msgs.msg
import argparse
import random
from nav_msgs.msg import Odometry
import time
import math
import numpy
import ViconTrackerPoseHandler as vt

odometry = None
init_odom = None

#the trajectory is used to control which preset trajectory the spheros follow
#1 is rgw only making a triangle--roslaunch sphero_node sphero_test_RGW_traj.launch
#2 is rgw,ggw,wrb moving to one waypoint--roslaunch sphero_node sphero_test_RGW_GGW_WRB_traj.launch
#3 is rgw,ggw making triangles--roslaunch sphero_node sphero_test_GGW_RGW_traj.launch
#for these trajectories, all Spheros are usually started near the origin though they do not have to be in order for the trajectory to succeed
trajectory=1



def save_odometry(data):
    global odometry

    # save initial
    if odometry is None:
        global init_odom
        init_odom = data.pose.pose

    odometry =data.pose.pose

#Define the waypoints to be visited, calibration angle, and vicon object based on which namespace the follow trajectory node belongs to)
if rospy.get_namespace()=="/sphero_rgw_group/":
	if trajectory==1 or trajectory==3:
		waypoints=numpy.array([ [1,1],[1,0],[1,-
1],[0,0]])
	elif trajectory==2:
		waypoints=numpy.array([ [1,0] ])
	theta_cal=0
	#define the rotation matrix to transorm from the vicon to sphero frame
	R_SV=numpy.array([ [math.cos(theta_cal),math.sin(theta_cal)],[-math.sin(theta_cal), math.cos(theta_cal)] ])
    	a = vt.ViconTrackerPoseHandler(None, None, "",51017, "Sphero2") 
elif rospy.get_namespace()=="/sphero_yoo_group/":
	#waypoints=numpy.array([ [1,1], [-1,1] ])
	waypoints=numpy.array([ [1,1]])
	theta_cal=0
	#define the rotation matrix to transorm from the vicon to sphero frame
	R_SV=numpy.array([ [math.cos(theta_cal),math.sin(theta_cal)],[-math.sin(theta_cal), math.cos(theta_cal)] ])
    	a = vt.ViconTrackerPoseHandler(None, None, "",51001, "Sphero1") 
elif rospy.get_namespace()=="/sphero_ggw_group/":
	if trajectory==3:
		waypoints=numpy.array([ [-1,1],[-1,0],[-1,-
1],[0,0]])
	elif trajectory==2:
		waypoints=numpy.array([ [-1,0] ])
	
	theta_cal=0
	#define the rotation matrix to transorm from the vicon to sphero frame
	R_SV=numpy.array([ [math.cos(theta_cal),math.sin(theta_cal)],[-math.sin(theta_cal), math.cos(theta_cal)] ])
    	a = vt.ViconTrackerPoseHandler(None, None, "",51018, "Sphero3") 
elif rospy.get_namespace()=="/sphero_wrb_group/":
	if trajectory==2:
		waypoints=numpy.array([ [0,-1] ])
	
	theta_cal=0
	#define the rotation matrix to transorm from the vicon to sphero frame
	R_SV=numpy.array([ [math.cos(theta_cal),math.sin(theta_cal)],[-math.sin(theta_cal), math.cos(theta_cal)] ])
    	a = vt.ViconTrackerPoseHandler(None, None, "",51020, "SpheroRGW")


size_waypoints=waypoints.shape #[m,n] length and width of waypoints
num_waypoints=size_waypoints[0] #first entry is length (width is 2-(x,y))
vel_mag=100


if __name__=="__main__":
    #parser = argparse.ArgumentParser(description="Test Sphero location")
    #args, unknown = parser.parse_known_args()
    rospy.init_node("test_vel")

    # publish to topics
    pub = rospy.Publisher('cmd_vel', geometry_msgs.msg.Twist, queue_size=10, latch=True)
    rate = rospy.Rate(10) # set publish rate

    # subscribe to odometry data
    rospy.Subscriber('odom', Odometry, callback=save_odometry)

    vel_msg_zero = geometry_msgs.msg.Twist(geometry_msgs.msg.Vector3(0,0,0), \
                                      geometry_msgs.msg.Vector3(0,0,0))
    

#loop through the goal points and move to all of them
for ind in range(0,num_waypoints):
#index of first goal is 0, last is num_waypoints-1
    #extract the current goal location
    rate.sleep()
    loc_goal=[]
    loc_goal.append(waypoints[ind][0])
    loc_goal.append(waypoints[ind][1])	
    print ind
    print "goal location"
    print loc_goal
	
    #get the sphero's current location from vicon
    rate.sleep()
    loc_init=a.getPose()
    loc=loc_init
    print "initial location"
    print loc_init
    theta=math.atan2((loc_goal[1]-loc[1]),(loc_goal[0]-loc[0]))
	
    #rospy.loginfo("Velocity: {0}".format(vel_msg))

   #while abs((loc[0]-loc_init[0]))<abs((loc_goal[0]-loc_init[0])) and abs((loc[1]-loc_init[1]))<abs((loc_goal[1]-loc_init[1])): # not at goal point
    #dist=math.hypot((loc_goal[0]-loc[0]),(loc_goal[1]-loc[1]))
    dist=math.sqrt((loc_goal[0]-loc[0])**2+(loc_goal[1]-loc[1])**2)
    closeEnough=0.1
    while dist>closeEnough:
	rate.sleep()
        loc=a.getPose()
	theta=math.atan2((loc_goal[1]-loc[1]),(loc_goal[0]-loc[0]))


   	v_x_V=vel_mag*math.cos(theta)
    	v_y_V=vel_mag*math.sin(theta)
	#convert the velocity message to the sphero frame using the angle from calibration
    	v_vect_V=numpy.array([[v_x_V],[v_y_V]])
    	v_vect_S=numpy.dot(R_SV,v_vect_V)
    	v_x_S=v_vect_S[0]
    	v_y_S=v_vect_S[1]
	#v_vect_S=numpy.array([[v_x_V],[v_y_V]])

    #Define the vel_msg command to send to the sphero

    	vel_msg = geometry_msgs.msg.Twist(geometry_msgs.msg.Vector3(v_vect_S[0],v_vect_S[1],0), \
                                      geometry_msgs.msg.Vector3(0,0,0))
	#dist=math.hypot((abs(loc_goal[0]-loc[0])),(abs(loc_goal[1]-loc[1])))
	dist=math.sqrt((loc_goal[0]-loc[0])**2+(loc_goal[1]-loc[1])**2)    
	pub.publish(vel_msg)

    #wait 2 seconds after finding the waypoint before going to the next
    print "final location"
    print loc
    start = time.time()
    while time.time()-start <2: # not rospy.is_shutdown():
        pub.publish(vel_msg_zero)
        rate.sleep()

	

#rospy.loginfo("Last Odometry: {0}".format(odometry))
#rospy.loginfo("Last Odometry: {0}".format(odometry))