# Creating a Robot Model in xacro and visualize using rviz


Xacro is just a simple version of urdf, You can easily convert xacro to urdf using `rosrun xacro xacro <FILE_NAME>.xacro --inorder > <FILE_NAME>_generated.urdf`


## Instructions: 

1. Navigate to the src folder of workspace. E.g: (`cd ~/Desktop/robot_modeling_ws`) 
2. Create Package (`catkin_create_pkg <PACKAGE_NAME> <DEP_1> <DEP_2>`). E.g: (`catkin_create_pkg pan_tilt_xacro roscpp tf geometry_msgs urdf xacro rviz`)
3. Create a folder `/urdf` and put all of your urdf models inside it.
4. Mode file extension is `.xacro`
5. Now, Build and Compile the Package `catkin_make`.
6. To visualize the model in 3D using rviz create a launch file inside the `/launch` directory.
```
Launch File : 

<launch>

  <arg name="gui" default="true" /> # argument used in further code for simplicity.

  # parameters values saved in parameter server of ros
  <param name="robot_description" textfile="$(find pan_tilt_urdf)/urdf/pan_tilt.urdf" />
  <param name="use_gui" value="$(arg gui)"/>

  # nodes running sequencially
  <node name="joint_state_publisher" pkg="joint_state_publisher" type="joint_state_publisher" />
  <node name="robot_state_publisher" pkg="robot_state_publisher" type="state_publisher" />
  <node name="rviz" pkg="rviz" type="rviz" args="$(find pan_tilt_urdf)/urdf.rviz" required="true" />

</launch>
```


## Precautions: 

1. Before creating package add source.bash file path in ~/.bashrc file and then restart your terminal. E.g: (`echo "source ~/Desktop/tutorial_ws/devel/setup.bash" >> ~/.bashrc`)
2. You needs to run `catkin_make` every time you make change in your code.
3. Run these commands before running launch file
```
sudo apt-get install ros-kinetic-urdf
sudo apt-get install ros-kinetic-xacro
sudo apt install ros-kinetic-joint-state-publisher-gui
```
4. After running launch file if rviz window opens but model does not displayed then click on Add button in display tab then click on RobotModel inside rviz package and set fixed_frame as base_link in Global option.