#Generating new custom msg types


##Instructions: 

1. Navigate to the src folder of workspace. E.g: (`cd ~/Desktop/tutorial_ws`) 
2. Create Package (`catkin_create_pkg <PACKAGE_NAME> <DEP_1> <DEP_2>`). E.g: (`catkin_create_pkg demo_cpp rospy std_msgs roscpp`)
3. Build Package (`catkin_make`).
4. Create a folder `msg` and put all of your custom msg file inside it. Extension of file is `.msg`
5. After writting all msg files. You needs to make some changes in `CMakeLists.txt` file and `Package.xml`.

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

## Generate messages in the 'msg' folder
add_message_files(
  FILES
  custom_msg.msg
)

## Generate added messages and services with any dependencies listed here
generate_messages(
  DEPENDENCIES
  std_msgs
  actionlib_msgs
)


Package.xml

Uncomment : 
<build_depend>message_generation</build_depend>
<exec_depend>message_runtime</exec_depend>

```

6. To include custom msg type use: `from <PACKAGE_NAME.msg import <FILE_NAME>` (Python) and `#include <PACKAGE_NAME>/<FILE_NAME>.msg` (C++)
7. Now, Build and Compile the Package `catkin_make`


##Precautions: 

1. Before creating package add source.bash file path in ~/.bashrc file and then restart your terminal. E.g: (`echo "source ~/Desktop/tutorial_ws/devel/setup.bash" >> ~/.bashrc`)
2. You needs to run `catkin_make` every time you make change in your code.