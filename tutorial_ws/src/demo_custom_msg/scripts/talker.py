#!/usr/bin/env python

import rospy
from demo_custom_msg.msg import custom_msg

def talker():

	rospy.init_node('talker', anonymous=True)
	pub = rospy.Publisher('chatter', custom_msg, queue_size=10)
	rate = rospy.Rate(10) # 10hz
	number = 0

	while not rospy.is_shutdown():
		msg = custom_msg()
		msg.name = 'Ammmy'
		msg.number = number
		rospy.loginfo(msg)
		pub.publish(msg)
		rate.sleep()
		number += 1

if __name__ == '__main__':
	try:
		talker()
	except rospy.ROSInterruptException:
		print("Ros error")
		pass