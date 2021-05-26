# Publishing value of Twist on /cmd_vel topic using keyboard (Python)


## Instructions: 

1. Navigate to the src folder of workspace. E.g: (`cd ~/Desktop/robot_modeling_ws`) 
2. Create Package (`catkin_create_pkg <PACKAGE_NAME> <DEP_1> <DEP_2>`). E.g: (`catkin_create_pkg robot_controller_keyboard geometry_msgs joint_state_controller joy roscpp rospy sensor_msgs std_msgs controller_manager`)
3. Build Package (`catkin_make`).
4. Create a folder `/script` and put all of your python code inside it.
5. Code Explaination : 
```python

from geometry_msgs.msg import Twist  # msg_type of /cmd_vel topic

import termios, tty                  # package for taking keyboard values


'''
Control Your Bot!
---------------------------
Moving around:
   q    w    e
   a    s    d
   z    x    c

i/k : increase/decrease only linear speed by 10%
j/l : increase/decrease only angular speed by 10%
space key, k : force stop
anything else : stop smoothly
'''

# Key Bindings
moveBindings = {
        'w':(1,0),
        'e':(1,-1),
        'a':(0,1),
        'd':(0,-1),
        'q':(1,1),
        'x':(-1,0),
        'c':(-1,1),
        'z':(-1,-1),
           }

speedBindings={
        'i':(1.1,1),
        'k':(.9,1),
        'j':(1,1.1),
        'l':(1,.9),
          }

def getKey():  # return which key is pressed

rospy.init_node('turtlebot_teleop')                      # Initialize the node
pub = rospy.Publisher('/cmd_vel', Twist, queue_size=5)   # Initialize the Publisher

twist = Twist()                                                             # Creating the instace of Twist Class
twist.linear.x = control_speed; twist.linear.y = 0; twist.linear.z = 0
twist.angular.x = 0; twist.angular.y = 0; twist.angular.z = control_turn
pub.publish(twist)                                                          # Publishing it to the /cmd_vel topic

```
Actual Code From : https://github.com/jocacace/diff_wheeled_robot_control/blob/master/scripts/diff_wheeled_robot_key


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