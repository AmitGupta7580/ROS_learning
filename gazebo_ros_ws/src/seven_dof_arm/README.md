# Visualize a xacro robot in gazebo and intracting with joint-state and joint-position controllers


## Instructions: 

1. Navigate to the src folder of workspace. E.g: (`cd ~/Desktop/robot_modeling_ws`) 
2. Create Package (`catkin_create_pkg <PACKAGE_NAME> <DEP_1> <DEP_2>`). E.g: (`catkin_create_pkg seven_dof_arm_gazebo gazebo_msgs gazebo_plugins gazebo_ros gazebo_ros_control mastering_ros_robot_description_pkg`)
3. Build Package (`catkin_make`).
4. Create a folder `/urdf` and put all of your robot.xacro models inside it.
5. To visualize the model in Gazero create a launch file inside the `/launch` directory.
```
Launch File : 

<launch>

  <!-- We resume the logic in empty_world.launch -->
  <include file="$(find gazebo_ros)/launch/empty_world.launch">
    <arg name="debug" value="false" />
    <arg name="gui" value="true" />
    <arg name="paused" value="false"/>
    <arg name="use_sim_time" value="true"/>
    <arg name="headless" value="false"/>
  </include>

  <!-- Load the URDF into the ROS Parameter Server -->
  <param name="robot_description" command="$(find xacro)/xacro --inorder '$(find seven_dof_arm)/urdf/seven_dof_arm.xacro'"/>

  <!-- Run a python script to the send a service call to gazebo_ros to spawn a URDF robot -->
  <node name="urdf_spawner" pkg="gazebo_ros" type="spawn_model" respawn="false" output="screen"
  args="-urdf -model seven_dof_arm -param robot_description"/> 

</launch>
```

6. To spawn sensor in robot model.
```
Change in urdf file : 

<!-- Define arm with gripper mounted on a base -->
  <!--
  <xacro:base name="base"/>
  <xacro:arm parent="base"/>
  <xacro:gripper parent="tool"/>
  -->
  <!-- Define RGB-D sensor -->
  <xacro:xtion_pro_live name="rgbd_camera" parent="base">
    <origin xyz="0.15 0.0 0.8" rpy="0 ${75.0 * deg_to_rad} 0"/>
    <origin xyz="0 0 0" rpy="${-90.0 * deg_to_rad} 0 ${-90.0 * deg_to_rad}"/>
  </xacro:xtion_pro_live>



  <!-- ros_control plugin -->
  <gazebo>
    <plugin name="gazebo_ros_control" filename="libgazebo_ros_control.so">
      <robotNamespace>/seven_dof_arm</robotNamespace>
    </plugin>
  </gazebo>
```

7. Spawn ros controller in gazebo.
```

.yaml config file to define controllers

Add in launch file

  <!-- Load joint controller configurations from YAML file to parameter server -->
  <rosparam file="$(find seven_dof_arm)/config/seven_dof_arm_gazebo_control.yaml" command="load"/>


  <!-- load the controllers -->
  <node name="controller_spawner" pkg="controller_manager" type="spawner" respawn="false"
  output="screen" ns="/seven_dof_arm" args="joint_state_controller
            joint1_position_controller
            joint2_position_controller
            joint3_position_controller
            joint4_position_controller
            joint5_position_controller
            joint6_position_controller
            joint7_position_controller"/>


  <!-- convert joint states to TF transforms for rviz, etc -->
  <node name="robot_state_publisher" pkg="robot_state_publisher" type="robot_state_publisher"
  respawn="false" output="screen">
    <remap from="/joint_states" to="/seven_dof_arm/joint_states" />
  </node>

```

## Precautions: 

1. Before creating package add source.bash file path in ~/.bashrc file and then restart your terminal. E.g: (`echo "source ~/Desktop/tutorial_ws/devel/setup.bash" >> ~/.bashrc`)
2. You needs to run `catkin_make` every time you make change in your code.
3. Run these commands before running launch file
```
sudo apt-get install ros-kinetic-urdf
sudo apt-get install ros-kinetic-xacro
sudo apt install ros-kinetic-joint-state-publisher-gui
sudo apt-get install ros-kinetic-ros-control ros-kinetic-joint-state-controller ros-kinetic-effort-controllers ros-kinetic-position-controllers ros-kinetic-velocity-controllers ros-kinetic-ros-controllers ros-kinetic-gazebo-ros ros-kinetic-gazebo-ros-control
```
4. `[WARN] [1621928735.651573, 0.000000]: Controller Spawner couldn't find the expected controller_manager ROS interface.` If this warning shows then seprate the spawn-controller launch file from view_world_gazebo.launch file. Actually your computer is slow if still does not able to create world but it executes the command of spawn-cntroller.