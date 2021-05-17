#Code with C++ in ROS


##Instructions: 

1. Navigate to the src folder of workspace. E.g: (`cd ~/Desktop/tutorial_ws`) 
2. Create Package (`catkin_create_pkg <PACKAGE_NAME> <DEP_1> <DEP_2>`). E.g: (`catkin_create_pkg demo_cpp rospy std_msgs roscpp`)
3. Build Package (`catkin_make`).
4. You has to put all of your C++ code inside `/PACKAGE_NAME/src`.
5. After writting all C++ codes. You needs to make some changes in `CMakeLists.txt` file.

```

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
add_executable(publisher src/publisher.cpp)
add_executable(subscriber src/subscriber.cpp)

## Specify libraries to link a library or executable target against
target_link_libraries(publisher ${catkin_LIBRARIES})
target_link_libraries(subscriber ${catkin_LIBRARIES})
```

6. Now, Build and Compile the Package `catkin_make`


##Precautions: 

1. Before creating package add source.bash file path in ~/.bashrc file and then restart your terminal. E.g: (`echo "source ~/Desktop/tutorial_ws/devel/setup.bash" >> ~/.bashrc`)
2. You needs to run `catkin_make` every time you make change in your code.