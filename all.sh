#!/bin/bash
source /home/qi/uav_simulator/devel/setup.sh
killall -9 roscore
killall -9 rosmaster

roscore & sleep 1;

#roslaunch so3_quadrotor_simulator map_generator.launch & sleep 5s;

roslaunch so3_quadrotor_simulator map_generator_moca.launch & sleep 5s;


#roslaunch bezier_planer real.launch & sleep 2s;

#rosbag record -a
