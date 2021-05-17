#include "ros/ros.h"
#include "demo_service_cpp/simple_srv.h"
#include <iostream>
#include <sstream>
using namespace std;

bool callback(demo_service_cpp::simple_srv::Request &req, demo_service_cpp::simple_srv::Response &res) {
	std::stringstream ss;
	ss << "Received Here";
	res.out = ss.str();
	ROS_INFO("From Client [%s], Server says [%s]",req.in.c_str(),res.out.c_str());
	return true;
}

int main(int argc, char **argv){
	ros::init(argc, argv, "server");
	ros::NodeHandle n;
	ros::ServiceServer service = n.advertiseService("demo_service", callback);
	ROS_INFO("Ready to receive from client.");
	ros::spin();
	return 0;
}