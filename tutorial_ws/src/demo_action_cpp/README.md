#Generating new custom msg types


##Explaining Code:

###Server:

1. First initialize a node with its unique name. `ros::init(argc, argv, "server_action")`.
2. Then create a Simple action server by including action name and callbacks.

```C++
actionlib::SimpleActionServer<demo_action_cpp::demo_actionAction> server;

server(<NodeHandle>, <ACTION_NAME>, boost::bind(&Demo_actionAction::executeCB, this, _1)
{
  server.registerPreemptCallback(boost::bind(&Demo_actionAction::preemptCB, this));
  server.start();
}

void preemptCB(){
  // this function is called when client wants to broke the connection with server. 
  // irrespective of the state of server.

  // server.setPreempted(result,"I got Preempted"); 
}

void executeCB(const demo_action_cpp::demo_actionGoalConstPtr &goal){
  // callback to handel the request from client
  // it takes goal (sended from client) as its params

  // server.setAborted(result,"I failed !"); // failed
  // server.setSucceeded(result);            // SUCCESS
  // server.publishFeedback(feedback);       // feedback
}
```

###Client:
1. First initialize a node with its unique name. `ros::init(argc, argv, "client")`.
2. Then create a Simple action client by including action name. 
`actionlib::SimpleActionClient<demo_action_cpp::demo_actionAction> client("demo_action", true);`
3. Then send request to server with specified goal value ans specific callbacks.

```C++
client.sendGoal(goal, &doneCb, &activeCb, &feedbackCb);

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
```


##Instructions: 

1. Navigate to the src folder of workspace. E.g: (`cd ~/Desktop/tutorial_ws`) 
2. Create Package (`catkin_create_pkg <PACKAGE_NAME> <DEP_1> <DEP_2>`). E.g: (`catkin_create_pkg demo_cpp rospy std_msgs roscpp actionlib`)
3. Build Package (`catkin_make`).
4. Create a folder `action` and put all of your action file inside it. Extension of file is `.action`

```

Format of .action file

#goal definition
int32 count
---
#result definition
int32 final_count
---
#feedback
int32 current_number

```

5. After writting all action files. You needs to make some changes in `CMakeLists.txt` file and `Package.xml`.

```

CMakeLists.txt


## Find catkin macros and libraries
## if COMPONENTS list like find_package(catkin REQUIRED COMPONENTS xyz)
## is used, also find other catkin packages
find_package(catkin REQUIRED COMPONENTS
  actionlib
  roscpp
  rospy
  std_msgs
  actionlib_msgs
  message_generation
)

## Generate actions in the 'action' folder
add_action_files(
  FILES
  demo_action.action
)

## Generate added messages and services with any dependencies listed here
generate_messages(
  DEPENDENCIES
  std_msgs
  actionlib_msgs
)

## Specify additional locations of header files
## Your package locations should be listed before other locations
include_directories(
  include
  ${catkin_INCLUDE_DIRS}
  ${Boost_INCLUDE_DIRS}
)

## Declare a C++ executable
## With catkin_make all packages are built within a single CMake context
## The recommended prefix ensures that target names across packages don't collide
add_executable(server src/server.cpp)
add_executable(client src/client.cpp)

## Specify libraries to link a library or executable target against
target_link_libraries(server ${catkin_LIBRARIES})
target_link_libraries(client ${catkin_LIBRARIES})


Package.xml

Uncomment : 
<build_depend>message_generation</build_depend>
<exec_depend>message_runtime</exec_depend>

```

6. To include action params use: `#include "<PACKAGE_NAME>/<FILE_NAME>Action.h"` (C++)
7. Now, Build and Compile the Package `catkin_make`


##Precautions: 

1. Before creating package add source.bash file path in ~/.bashrc file and then restart your terminal. E.g: (`echo "source ~/Desktop/tutorial_ws/devel/setup.bash" >> ~/.bashrc`)
2. You needs to run `catkin_make` every time you make change in your code.