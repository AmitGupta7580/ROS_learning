#!/usr/bin/env python

import rospy
from demo_custom_msg.msg import custom_msg

def callback(data):
	rospy.loginfo(rospy.get_caller_id() + "[%d]I heared from %s", data.number, data.name)

def listener():
	rospy.init_node('listener', anonymous=True)
	rospy.Subscriber("chatter", custom_msg, callback)
	rospy.spin()

if __name__ == '__main__':
	listener()