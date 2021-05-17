#include "ros/ros.h"
#include "std_msgs/Int32.h"
#include <actionlib/server/simple_action_server.h>
#include "demo_action_cpp/demo_actionAction.h"
#include <iostream>
#include <sstream>

class Demo_actionAction {
	protected:
  		ros::NodeHandle nh_;
  		actionlib::SimpleActionServer<demo_action_cpp::demo_actionAction> server;
  		demo_action_cpp::demo_actionFeedback feedback;
  		demo_action_cpp::demo_actionResult result;

  		std::string action_name;
  		int goal;
  		int progress;

	public:
  		Demo_actionAction(std::string name) : 
  			server(nh_, name, boost::bind(&Demo_actionAction::executeCB, this, _1), false), action_name(name){
				// server.registerPreemptCallback(boost::bind(&Demo_actionAction::preemptCB, this));
				server.start();
  			}

  	~Demo_actionAction(void){}

  	void preemptCB(){
  		// this function is called when client wants to broke the connection with server. 
  		// irrespective of the state of server.
		ROS_WARN("%s got preempted!", action_name.c_str());
		result.final_count = progress;
		server.setPreempted(result,"I got Preempted"); 
  	}

  	void executeCB(const demo_action_cpp::demo_actionGoalConstPtr &goal){
		if(!server.isActive() || server.isPreemptRequested()) return;
		ros::Rate rate(5);
		ROS_INFO("%s is processing the goal %d", action_name.c_str(), goal->count);
		for(progress = 1 ; progress <= goal->count; progress++){
			if(!ros::ok()){
				result.final_count = progress;
				server.setAborted(result,"I failed !");
				ROS_INFO("%s Shutting down",action_name.c_str());
				break;
			}
			if(!server.isActive() || server.isPreemptRequested()) return;

			if(goal->count <= progress){
				ROS_INFO("%s Succeeded at getting to goal %d", action_name.c_str(), goal->count);
				result.final_count = progress;
				server.setSucceeded(result);
			} else {
				ROS_INFO("Setting to goal %d / %d",feedback.current_number,goal->count);
				feedback.current_number = progress;
				server.publishFeedback(feedback);
			}
			rate.sleep();
		}	
  	}
};

int main(int argc, char** argv){
  ros::init(argc, argv, "server_action");
  ROS_INFO("Starting Demo Action Server");
  Demo_actionAction demo_action_obj("demo_action");
  ros::spin();
  return 0;
}