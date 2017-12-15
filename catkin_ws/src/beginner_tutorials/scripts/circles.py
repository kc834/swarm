#!/usr/bin/env python

# Kevin Chaudhari
# circles.py
# 10 Sept 2017

# The purpose of this script is to make the spheros turn

import rospy

def rightTurn():
    pub = rospy.Publisher(cmd_vel, geometry_msgs/Twist, queue_size=10)
    rospy.init_node('circle', anonymous=True)
    rate=rospy.Rate(1)
    while not rospy.is_shutdown():
        cmd_vel[1] = cmd_vel[1] - 5
        rospy.loginfo(cmd_vel)
        pub.publish(cmd_vel)
        rate.sleep()


if __name__ == '__main__':
    try:
        turn()
    except rospy.ROSInterruptException:
        pass
