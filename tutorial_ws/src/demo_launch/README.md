# Run ROS code with launch file

## Code:

```
<launch>
	<node name="listener_node" pkg="demo" type="listener.py" output="screen"/>
	<node name="talker_node" pkg="demo" type="talker.py" output="screen"/>
</launch>
```

## Theory:

Once all the node of your package run indivisually then you can run all the node by just one command `roslaunch <PACKAGE_NAME> <LAUNCH_FILE>`

## Instructions: 

1. Create a folder `launch` inside your package and put all of your launch files inside it.
2. Create a file with extension `.launch` and give the order in which you want to run your codes.
