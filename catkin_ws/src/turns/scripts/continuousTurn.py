#!/usr/bin/env python

# Kevin Chaudhari
# circles.py
# 10 Sept 2017

# The purpose of this script is to make the spheros turn

import rospy
from geometry_msgs.msg import Twist

def continuousTurn():
    rospy.init_node('circle', anonymous=True)
    pub = rospy.Publisher('cmd_vel', Twist, queue_size=10)

    #initializing variables
    maxVel = 200
    turn1 = True
    turn2 = False
    turn3 = False
    turn4 = False
    msg = Twist()
    xVel = msg.linear.x = maxVel
    yVel = msg.linear.y = 0
    msg.linear.z = 0
    msg.angular.x = 0
    msg.angular.y = 0
    msg.angular.z = 0
    t = 0;
    rotationSpeed = 1;

    while not rospy.is_shutdown():

        # Determine which turn we are on
        if yVel >= 200:
            turn1 = False
            turn2 = True
        elif xVel <= -200:
            turn2 = False
            turn3 = True
        elif yVel <= -200:
            turn3 = False
            turn4 = True
        elif xVel >= 200:
                turn4 = False
                turn1 = True

        # turn
        if t >= rotationSpeed:
            if turn1:
                if xVel > 0:
                    print('OK')
                    xVel = max(xVel - 0.2, 0)
                    yVel = min(yVel + 0.2, maxVel)
                    t = 0;
            elif turn2:
                if yVel > 0:
                    yVel = max(yVel - 0.2, 0)
                    xVel = max(xVel - 0.2, -maxVel)
                    t = 0;
            elif turn3:
                if xVel < 0:
                    xVel = min(xVel + 0.2, 0)
                    yVel = max(yVel - 0.2, -maxVel)
                    t = 0;
            elif turn4:
                if yVel < 0:
                    yVel = min(yVel + 0.2, 0)
                    xVel = min(xVel + 0.2, maxVel)
                    t = 0;
        else:
            t = t + 0.1

        msg.linear.x = xVel
        msg.linear.y = yVel
        rospy.loginfo(msg);
        pub.publish(msg);


if __name__ == '__main__':
    try:
        continuousTurn()
    except rospy.ROSInterruptException:
        pass
