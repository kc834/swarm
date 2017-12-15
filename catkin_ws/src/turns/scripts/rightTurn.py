#!/usr/bin/env python

# Kevin Chaudhari
# circles.py
# 10 Sept 2017

# The purpose of this script is to make the spheros turn

import rospy
from geometry_msgs.msg import Twist

def rightTurn():
    rospy.init_node('circle', anonymous=True)
    pub = rospy.Publisher('cmd_vel', Twist, queue_size=10)
    # rate = rospy.Rate(10)
    msg = Twist()
    msg.linear.x = 200
    msg.linear.y = 0
    msg.linear.z = 0
    msg.angular.x = 0
    msg.angular.y = 0
    msg.angular.z = 0
    t = 0;
    while not rospy.is_shutdown():
        if msg.linear.x > 0 and t > 2:
            msg.linear.x = max(msg.linear.x - 0.2, 0)
            msg.linear.y = msg.linear.y + 0.2
            t = 0;
        else:
            t = t + 0.1
        rospy.loginfo(msg)
        pub.publish(msg)
        print(msg)
        print(t)


if __name__ == '__main__':
    try:
        rightTurn()
    except rospy.ROSInterruptException:
        pass
