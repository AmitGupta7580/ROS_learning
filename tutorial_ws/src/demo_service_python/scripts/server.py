#!/usr/bin/env python

import rospy
from demo_service_python.srv import python_srv, python_srvResponse

def handle_add_two_ints(req):
	print("Returning [%s + %s = %s]"%(req.a, req.b, (req.a + req.b)))
	return python_srvResponse(req.a + req.b)

def add_two_ints_server():
	rospy.init_node('python_server')
	s = rospy.Service('python_service', python_srv, handle_add_two_ints)
	print("Ready to add two ints.")
	rospy.spin()

if __name__ == "__main__":
	add_two_ints_server()