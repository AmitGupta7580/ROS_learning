# Generating new custom msg types

## Code:

### Server
```C++
#include "demo_service_cpp/simple_srv.h"

bool callback(demo_service_cpp::simple_srv::Request &req, demo_service_cpp::simple_srv::Response &res) {
	std::stringstream ss;
	ss << "Received Here";
	res.out = ss.str();
	ROS_INFO("From Client [%s], Server says [%s]",req.in.c_str(),res.out.c_str());
	return true;
}

ros::init(argc, argv, "server");
ros::NodeHandle n;
ros::ServiceServer service = n.advertiseService("demo_service", callback);
ROS_INFO("Ready to receive from client.");
```

### Client
```C++
ros::init(argc, argv, "client");
ros::NodeHandle n;
ros::Rate loop_rate(10);
ros::ServiceClient client = n.serviceClient<demo_service_cpp::simple_srv>("demo_service");

demo_service_cpp::simple_srv srv;
std::stringstream ss;
ss << "Sending from Here";
srv.request.in = ss.str();
```

## Instructions: 

1. Navigate to the src folder of workspace. E.g: (`cd ~/Desktop/tutorial_ws`) 
2. Create Package (`catkin_create_pkg <PACKAGE_NAME> <DEP_1> <DEP_2>`). E.g: (`catkin_create_pkg demo_cpp rospy std_msgs roscpp`)
3. Build Package (`catkin_make`).
4. Create a folder `srv` and put all of your service file inside it. Extension of file is `.srv`

```

Format of .srv file

#{Request params}
int32 a
int32 b
---
#{Response params}
int32 sum

```

5. After writting all srv files. You needs to make some changes in `CMakeLists.txt` file and `Package.xml`.

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

## Generate services in the 'srv' folder
add_service_files(
  FILES
  simple_srv.srv
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

6. To include service request and response use: `#include <PACKAGE_NAME>/<FILE_NAME>.srv` (C++)
7. Now, Build and Compile the Package `catkin_make`


## Precautions: 

1. Before creating package add source.bash file path in ~/.bashrc file and then restart your terminal. E.g: (`echo "source ~/Desktop/tutorial_ws/devel/setup.bash" >> ~/.bashrc`)
2. You needs to run `catkin_make` every time you make change in your code.
