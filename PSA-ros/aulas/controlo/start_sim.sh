#!/bin/bash 
source /ros/devel/setup.bash
roslaunch gazebo_ros empty_world.launch &
rosparam set robot_description -t pend.urdf
rosrun gazebo_ros spawn_model -file pend.urdf -urdf -z 0 -model my_pend
rosrun controller_manager controller_manager spawn /pend_robot/joint_state_controller
rosrun controller_manager controller_manager spawn /pend_robot/effort_controller