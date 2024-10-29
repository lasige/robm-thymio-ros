#!/bin/bash 
source /ros/devel/setup.bash
roslaunch gazebo_ros empty_world.launch &
echo "Waiting..."
sleep 5
echo "Waiting..."
rosparam set robot_description -t pend.urdf
rosparam load control.yaml
rosrun gazebo_ros spawn_model -file pend.urdf -urdf -z 0 -model my_pend
rosrun controller_manager controller_manager &
rosservice call /pend_robot/controller_manager/load_controller "name: 'joint_state_controller'"
rosservice call /pend_robot/controller_manager/load_controller "name: 'effort_controller'"