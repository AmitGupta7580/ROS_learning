# Creating a Robot Model in URDF and visualize using rviz


## Instructions: 

1. Navigate to the src folder of workspace. E.g: (`cd ~/Desktop/robot_modeling_ws`) 
2. Create Package (`catkin_create_pkg <PACKAGE_NAME> <DEP_1> <DEP_2>`). E.g: (`catkin_create_pkg pan_tilt_urdf roscpp tf geometry_msgs urdf rviz`)
3. Build Package (`catkin_make`).
4. Create a folder `/urdf` and put all of your urdf models inside it.
5. Mode file extension is `.urdf`

```

File format : (xml)

<?xml version="1.0"?>
<robot name="<ROBOT_NAME>">

  <link name="<LINK_NAME>">

    <visual>
      <geometry>
		<<SHAPE> length="0.01" radius="0.2"/>
      </geometry>
      <origin rpy="0 0 0" xyz="0 0 0"/>
      <material name="<MATERIAL_NAME>">
        <color rgba="1 1 0 1"/>
      </material>
    </visual>

    <collision>
      <geometry>
		<<SHAPE> length="0.03" radius="0.2"/>
      </geometry>
      <origin rpy="0 0 0" xyz="0 0 0"/>
    </collision>
    <inertial>
		<mass value="1"/>
		<inertia ixx="1.0" ixy="0.0" ixz="0.0" iyy="1.0" iyz="0.0" izz="1.0"/>
    </inertial>
  </link>

  # revolute, continuous, prismatic, fixed, floating, and planar <- types of joint type
  <joint name="<JOINT_NAME>" type="<TYPE>"> 
    <parent link="<LINK1_NAME>"/>
    <child link="<LINK1_NAME>"/>
    <origin xyz="0 0 0.1"/>
    <axis xyz="0 0 1" />
    <limit effort="300" velocity="0.1" lower="-3.14" upper="3.14"/>
    <dynamics damping="50" friction="1"/>
  </joint>

  <link name="<LINK2_NAME>">
  	....
    ....
  </link>

</robot>
```

6. To check the validity of model run `check_urdf <PATH>/<FILE_NAME>.urdf`.
7. Now, Build and Compile the Package `catkin_make`.
8. To change urdf model to graphics run `urdf_to_graphiz <PATH>/<FILE_NAME>.urdf`.
9. To visualize the model in 3D using rviz create a launch file inside the `/launch` directory.
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