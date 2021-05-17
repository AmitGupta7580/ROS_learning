# Implementing ROS actions in python


## Explaining Code:

### Server:

1. First initialize a node with its unique name. `rospy.init_node('python_server')`.
2. Then create a Simple action server by including action name and callbacks.
```python

class SimpleServer(object):

  _feedback = demo_action_python.msg.python_actionFeedback()
  _result = demo_action_python.msg.python_actionResult()

  def __init__(self):
    self._action_name = 'python_action'
    self._server = actionlib.SimpleActionServer(
      self._action_name, 
      demo_action_python.msg.python_actionAction, 
      execute_cb=self.execute_cb, 
      auto_start = False
    )
    self._server.start()
    rospy.loginfo("Python Action server is started")
    
  def execute_cb(self, goal):
    # callback to handel the request from client
    # it takes goal (sended from client) as its params

    self._server.set_preempted()                   # failed
    self._server.set_succeeded(self._result)       # SUCCESS
    self._server.publish_feedback(self._feedback)  # feedback

```

### Client:
1. First initialize a node with its unique name. `rospy.init_node('python_client')`.
2. Then create a Simple action client by including action name. 
`client = actionlib.SimpleActionClient('python_action', demo_action_python.msg.python_actionAction)`
3. Then send request to server with specified goal value ans specific callbacks.

```python

client.send_goal(demo_action_python.msg.python_actionGoal(count=goal), doneCb, activeCb, feedbackCb)

def doneCb(state, result):
    rospy.loginfo("Answer: %i", result.final_count);

def activeCb():
  rospy.loginfo("Goal just went active")

def feedbackCb(feedback):
  rospy.loginfo("FeedbackCb: server responded with feedback [%d]", feedback.current_number);

```


## Instructions: 

1. Navigate to the src folder of workspace. E.g: (`cd ~/Desktop/tutorial_ws`) 
2. Create Package (`catkin_create_pkg <PACKAGE_NAME> <DEP_1> <DEP_2>`). E.g: (`catkin_create_pkg demo_action_python rospy std_msgs rospy actionlib_msgs actionlib`)
3. Build Package (`catkin_make`).
4. Create a folder `action` and put all of your action file inside it. Extension of file is `.action`

```

Format of .action file

#goal definition
int32 count
---
#result definition
int32 final_count
---
#feedback
int32 current_number

```

5. After writting all action files. You needs to make some changes in `CMakeLists.txt` file and `Package.xml`.

```

CMakeLists.txt


## Find catkin macros and libraries
## if COMPONENTS list like find_package(catkin REQUIRED COMPONENTS xyz)
## is used, also find other catkin packages
find_package(catkin REQUIRED COMPONENTS
  actionlib
  rospy
  std_msgs
  actionlib_msgs
  message_generation
)

## Generate actions in the 'action' folder
add_action_files(
  FILES
  python_action.action
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

6. To include action params use: `#include "<PACKAGE_NAME>/<FILE_NAME>Action.h"` (C++)
7. Now, Build and Compile the Package `catkin_make`


## Precautions: 

1. Before creating package add source.bash file path in ~/.bashrc file and then restart your terminal. E.g: (`echo "source ~/Desktop/tutorial_ws/devel/setup.bash" >> ~/.bashrc`)
2. You needs to run `catkin_make` every time you make change in your code.
