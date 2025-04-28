#!/bin/bash

# Source ROS setup
echo "Source ROS setup"
source /opt/ros/noetic/setup.bash

# Source workspace setup
echo "Source workspace setup"
source /home/bot/workspace/my_first_build_pipeline/assignment_ws/devel/setup.bash

# Launch Gazebo and RViz
roslaunch gem_gazebo gem_gazebo_rviz.launch