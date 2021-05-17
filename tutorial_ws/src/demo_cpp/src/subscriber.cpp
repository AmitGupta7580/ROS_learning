#include "ros/ros.h"
#include "std_msgs/Int32.h"
#include <iostream>

void callback(const std_msgs::Int32::ConstPtr& msg){
	ROS_INFO("Received [%d]",msg->data);
}

int main(int argc, char **argv){
	ros::init(argc, argv, "subscriber");
	ros::NodeHandle node_obj;
	ros::Subscriber number_subscriber = node_obj.subscribe("/numbers", 10, callback);
	ros::spin();
	return 0;
}