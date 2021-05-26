# Visualize a xacro robot in gazebo and intracting with joint-state and joint-position controllers


## Instructions: 

1. Navigate to the src folder of workspace. E.g: (`cd ~/Desktop/robot_modeling_ws`) 
2. Create Package (`catkin_create_pkg <PACKAGE_NAME> <DEP_1> <DEP_2>`). E.g: (`catkin_create_pkg differential_wheeled_robot_gazebo gazebo_msgs gazebo_plugins gazebo_ros gazebo_ros_control mastering_ros_robot_description_pkg`)
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

  <!-- urdf xml robot description loaded on the Parameter Server-->  
  <param name="robot_description" command="$(find xacro)/xacro --inorder '$(find differential_wheeled_robot_gazebo)/urdf/diff_wheeled_robot.xacro'" /> 

  <!-- Run a python script to the send a service call to gazebo_ros to spawn a URDF robot -->
  <node name="urdf_spawner" pkg="gazebo_ros" type="spawn_model" respawn="false" output="screen"
  args="-urdf -model diff_wheeled_robot -param robot_description"/> 

</launch>
```

6. To spawn laser in robot model.
```
Change in urdf file : 

<!-- SENSORS -->
  
  <!-- hokuyo -->

  <link name="hokuyo_link">
    <visual>
      <origin xyz="0 0 0" rpy="0 0 0" />
      <geometry>
        <box size="${hokuyo_size} ${hokuyo_size} ${hokuyo_size}"/>
      </geometry>
      <material name="Blue" />
    </visual>
  </link>
  <joint name="hokuyo_joint" type="fixed">
    <origin xyz="${base_radius - hokuyo_size/2} 0 ${base_height+hokuyo_size/4}" rpy="0 0 0" />
    <parent link="base_link"/>
    <child link="hokuyo_link" />
  </joint>
  <gazebo reference="hokuyo_link">
    <material>Gazebo/Blue</material>
    <turnGravityOff>false</turnGravityOff>
    <sensor type="ray" name="head_hokuyo_sensor">
      <pose>${hokuyo_size/2} 0 0 0 0 0</pose>
      <visualize>false</visualize>
      <update_rate>40</update_rate>
      <ray>
        <scan>
          <horizontal>
            <samples>720</samples>
            <resolution>1</resolution>
            <min_angle>-1.570796</min_angle>
            <max_angle>1.570796</max_angle>
          </horizontal>
        </scan>
        <range>
          <min>0.10</min>
          <max>10.0</max>
          <resolution>0.001</resolution>
        </range>
      </ray>
      <plugin name="gazebo_ros_head_hokuyo_controller" filename="libgazebo_ros_laser.so">
        <topicName>/scan</topicName>
        <frameName>hokuyo_link</frameName>
      </plugin>
    </sensor>
  </gazebo>
```

7. Result of laser scan the value of lear sscan is published on `/scan` topic. To visualize it open rviz command : `rosrun rviz rviz` then add Laser in display tab, select `/scan` as its topic.
8. Moving the mobile robot in Gazebo needs to add libgazebo_ros_diff_drive.so file from gazebo-plugin to add behaviour of Differential vehicle.
```
Change in urdf file : 

<!-- Differential drive controller  -->
  <gazebo>
    <plugin name="differential_drive_controller" filename="libgazebo_ros_diff_drive.so">
      <legacyMode>true</legacyMode>
      <rosDebugLevel>Debug</rosDebugLevel>
      <publishWheelTF>false</publishWheelTF>
      <robotNamespace>/</robotNamespace>
      <publishTf>1</publishTf>
      <publishWheelJointState>false</publishWheelJointState>
      <alwaysOn>true</alwaysOn>
      <updateRate>100.0</updateRate>
      <leftJoint>front_left_wheel_joint</leftJoint>
      <rightJoint>front_right_wheel_joint</rightJoint>
      <wheelSeparation>${2*base_radius}</wheelSeparation>
      <wheelDiameter>${2*wheel_radius}</wheelDiameter>
      <broadcastTF>1</broadcastTF>
      <wheelTorque>30</wheelTorque>
      <wheelAcceleration>1.8</wheelAcceleration>
      <commandTopic>cmd_vel</commandTopic>
      <odometryFrame>odom</odometryFrame> 
      <odometryTopic>odom</odometryTopic> 
      <robotBaseFrame>base_footprint</robotBaseFrame>


    </plugin>
  </gazebo> 

```

9. Command to publish velocity of Differential vechicle : `rostopic pub /cmd_vel geometry_msgs/Twist -r 3 -- '[0.0, 0.0, 0.0]' '[0.0, 0.0, 0.0]'` , where rate is 3 and msg type is geometry_msgs/Twist `linear : [x, y, z], angular : [x, y, z]`.
10. Adding joint_state_publisher and robot_state_publisher.
```
Change in launch file

  <node name="joint_state_publisher" pkg="joint_state_publisher" type="joint_state_publisher" ></node> 
  <!-- start robot state publisher -->
  <node pkg="robot_state_publisher" type="robot_state_publisher" name="robot_state_publisher" output="screen" >
    <param name="publish_frequency" type="double" value="50.0" />
  </node>

```

11. Adding the ROS teleop node. The ROS teleop node publishes the ROS Twist command by taking keyboard inputs. Run `robot_controller_keyboard package using keyboard_controller.launch file`.


## Precautions: 

1. Before creating package add source.bash file path in ~/.bashrc file and then restart your terminal. E.g: (`echo "source ~/Desktop/tutorial_ws/devel/setup.bash" >> ~/.bashrc`)
2. You needs to run `catkin_make` every time you make change in your code.
3. Run these commands before running launch file
```
sudo apt-get install ros-kinetic-urdf
sudo apt-get install ros-kinetic-xacro
sudo apt install ros-kinetic-joint-state-publisher-gui
sudo apt-get install ros-kinetic-ros-control ros-kinetic-joint-state-controller ros-kinetic-effort-controllers ros-kinetic-position-controllers ros-kinetic-velocity-controllers ros-kinetic-ros-controllers ros-kinetic-gazebo-ros ros-kinetic-gazebo-ros-control ros-kinetic-joy
```
4. `[WARN] [1621928735.651573, 0.000000]: Controller Spawner couldn't find the expected controller_manager ROS interface.` If this warning shows then seprate the spawn-controller launch file from view_world_gazebo.launch file. Actually your computer is slow if still does not able to create world but it executes the command of spawn-cntroller.