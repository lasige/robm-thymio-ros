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
sleep 2
rosservice call /pend_robot/controller_manager/switch_controller {"start_controllers: ['joint_state_controller','effort_controller'],stop_controllers: [''],strictness: 1,start_asap: true,timeout: 0.0"}
rqt_plot /pend_robot/joint_states/position[0],/pend_robot/joint_states/effort[0] &