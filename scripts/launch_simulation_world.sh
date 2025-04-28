#!/bin/bash

# Source ROS setup
echo "Source ROS setup"
source /opt/ros/noetic/setup.bash

# Source workspace setup
echo "Source workspace setup"
source assignment_ws/devel/setup.bash

# Launch Gazebo and RViz in the background
roslaunch gem_gazebo gem_gazebo_rviz.launch &

# Give the launch process some time to start (optional, adjust if necessary)
sleep 5