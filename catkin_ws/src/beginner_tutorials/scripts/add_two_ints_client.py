#!/usr/bin/env python

import sys #why sys
import rospy
from beginner_tutorials.srv import *

def add_two_ints_client(x, y):
    rospy.wait_for_service('add_two_ints') # wait until available
    try:
        # make a proxy to the service of the type AddTwoInts
        # Basically an instantiation
        add_two_ints = rospy.ServiceProxy('add_two_ints', AddTwoInts)
        respl = add_two_ints(x, y) #add the ints
        return respl.sum #return the sum
    except rospy.ServiceException as e: #any error
        print "Service call failed: %s" %e

def usage():
    return "%s [x y]" %sys.argv[0] # prints name of script

if __name__ == "__main__":
    if len(sys.argv) == 3:
        x= int(sys.argv[1]) #argument 1
        y= int(sys.argv[2]) #argument 2
    else:
        print usage()
        sys.exit(1)
    print "Requesting %s+%s"%(x, y)
    print "%s + %s = %s"%(x, y, add_two_ints_client(x, y)) #calls fxn
