#Generating new custom msg types


##Instructions: 

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

5. After writting all srv files. You needs to make some changes in `CMakeLists.txt` file.

```

CMakeLists.txt


## Find catkin macros and libraries
## if COMPONENTS list like find_package(catkin REQUIRED COMPONENTS xyz)
## is used, also find other catkin packages
find_package(catkin REQUIRED COMPONENTS
  rospy
  std_msgs
  message_generation
)

## Generate services in the 'srv' folder
add_service_files(
  FILES
  python_srv.srv
)

## Generate added messages and services with any dependencies listed here
generate_messages(
  DEPENDENCIES
  std_msgs
  actionlib_msgs
)

```

6. To include service request and response use: `from <PACKAGE_NAME>.srv import *` (Python)
7. Now, Build and Compile the Package `catkin_make`


##Precautions: 

1. Before creating package add source.bash file path in ~/.bashrc file and then restart your terminal. E.g: (`echo "source ~/Desktop/tutorial_ws/devel/setup.bash" >> ~/.bashrc`)
2. You needs to run `catkin_make` every time you make change in your code.