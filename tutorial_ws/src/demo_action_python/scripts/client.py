#!/usr/bin/env python

import rospy
import actionlib
import demo_action_python.msg

def doneCb(state, result):
    rospy.loginfo("Answer: %i", result.final_count);

def activeCb():
	rospy.loginfo("Goal just went active")

def feedbackCb(feedback):
	rospy.loginfo("FeedbackCb: server responded with feedback [%d]", feedback.current_number);

def client(goal):
	client = actionlib.SimpleActionClient('python_action', demo_action_python.msg.python_actionAction)
	client.wait_for_server()
	client.send_goal(demo_action_python.msg.python_actionGoal(count=goal), doneCb, activeCb, feedbackCb)
	client.wait_for_result()
	client.cancel_goal()
	return client.get_result()

if __name__ == "__main__":
	try:
		rospy.init_node('python_client')
		goal = int(input("Enter your goal: "))
		result = client(goal)
		rospy.loginfo("Got the result %d" % result.final_count)
	except rospy.ROSInterruptException:
		print("program interrupted before completion")