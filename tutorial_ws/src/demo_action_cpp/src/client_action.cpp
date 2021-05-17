#include "ros/ros.h"
#include <iostream>
#include <actionlib/client/simple_action_client.h>
#include <actionlib/client/terminal_state.h>
#include "demo_action_cpp/demo_actionAction.h"

void doneCb(const actionlib::SimpleClientGoalState& state, const demo_action_cpp::demo_actionResultConstPtr& result){
    ROS_INFO("Finished in state [%s]", state.toString().c_str());
    ROS_INFO("Answer: %i", result->final_count);
    ros::shutdown();
}

void activeCb(){
    ROS_INFO("Goal just went active");
}

void feedbackCb(const demo_action_cpp::demo_actionFeedbackConstPtr& feedback) {
    ROS_INFO(" feedbackCb: server responded with feedback [%d]", feedback->current_number);
}

int main (int argc, char **argv){
  ros::init(argc, argv, "client");

  if(argc != 2){
    ROS_INFO("%d",argc);
    ROS_WARN("Usage: client_action <goal>");
    return 1;
	}

  actionlib::SimpleActionClient<demo_action_cpp::demo_actionAction> client("demo_action", true);

  ROS_INFO("Waiting for action server to start.");
  client.waitForServer();

  ROS_INFO("Action server started, sending goal.");

  demo_action_cpp::demo_actionGoal goal;
  goal.count = atoi(argv[1]);
  
  client.sendGoal(goal, &doneCb, &activeCb, &feedbackCb);

  bool finished_before_timeout = client.waitForResult(ros::Duration(5.0));

  if (finished_before_timeout){
    actionlib::SimpleClientGoalState state = client.getState();
    ROS_INFO("Action finished: %s",state.toString().c_str());
    client.cancelGoal();
  }
  else
    ROS_INFO("Action did not finish before the time out.");

  //exit
  return 0;
}