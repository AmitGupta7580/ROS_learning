# Code with Python in ROS

## Code:

### Publisher

```python
def talker():

	rospy.init_node('talker', anonymous=True)
	pub = rospy.Publisher('chatter', String, queue_size=10)
	rate = rospy.Rate(10) # 10hz

	while not rospy.is_shutdown():
		hello_str = 'hello ammmy %s' % rospy.get_time()
		rospy.loginfo(hello_str)
		pub.publish(hello_str)
		rate.sleep()
```

### Subscriber

```python
def callback(data):
	rospy.loginfo(rospy.get_caller_id() + "I heared %s", data.data)

def listener():
	rospy.init_node('listener', anonymous=True)
	rospy.Subscriber("chatter", String, callback)
	rospy.spin()
```

## Instructions: 

1. Navigate to the src folder of workspace. E.g: (`cd ~/Desktop/tutorial_ws`) 
2. Create Package (`catkin_create_pkg <PACKAGE_NAME> <DEP_1> <DEP_2>`). E.g: (`catkin_create_pkg demo_python rospy std_msgs`)
3. Build Package (`catkin_make`).
4. Create new folder `scripts` inside package and put all of your python code inside it. 
5. Build and Compile Package `catkin_make`
6. Now, enjoy the power of ROS `rosrun <PACKAGE_NAME> <NODE.py>`. E.g: (`rosrun demo_python talker.py`)

## Precautions: 

1. Before creating package add source.bash file path in ~/.bashrc file and then restart your terminal. E.g: (`echo "source ~/Desktop/tutorial_ws/devel/setup.bash" >> ~/.bashrc`)
