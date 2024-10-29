#!/bin/bash 
source /ros/devel/setup.bash
roslaunch gazebo_ros empty_world.launch &
echo "Waiting..."
sleep 5
echo "Waiting..."
rosparam set robot_description -t pend.urdf
rosparam load control.yaml
rosrun gazebo_ros spawn_model -file pend.urdf -urdf -z 0 -model my_pend
#rosrun controller_manager controller_manager spawn /pend_robot/joint_state_controller
#rosrun controller_manager controller_manager spawn /pend_robot/effort_controller