#!/usr/bin/env python

import rospy
import actionlib
import demo_action_python.msg

class SimpleServer(object):

	_feedback = demo_action_python.msg.python_actionFeedback()
	_result = demo_action_python.msg.python_actionResult()

	def __init__(self):
		self._action_name = 'python_action'
		self._server = actionlib.SimpleActionServer(self._action_name, demo_action_python.msg.python_actionAction, execute_cb=self.execute_cb, auto_start = False)
		self._server.start()
		rospy.loginfo("Python Action server is started")
		
	def execute_cb(self, goal):

		r = rospy.Rate(5.0)
		progress = 0
		while True:
			if self._server.is_preempt_requested():
				# request is cancelled in between the proccessing
				rospy.loginfo('%s: Preempted' % self._action_name)
				self._server.set_preempted()
				break

			if goal.count <= progress:
				# when goal is reached
				self._result.final_count = progress
				rospy.loginfo('%s: Succeeded' % self._action_name)
				self._server.set_succeeded(self._result)
				break

			self._feedback.current_number = progress
			rospy.loginfo('Feedback: %d / %d', self._feedback.current_number, goal.count)
			self._server.publish_feedback(self._feedback)
			progress += 1
			r.sleep()


if __name__ == "__main__":
	rospy.init_node('python_server')
	server = SimpleServer()
	rospy.spin()