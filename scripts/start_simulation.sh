#!/bin/bash

# Source ROS setup
echo "Source ROS setup"
source /opt/ros/noetic/setup.bash

# Source workspace setup
echo "Source workspace setup"
source /home/bot/workspace/my_first_build_pipeline/assignment_ws/devel/setup.bash

# Start the simulation
rosrun gem_pure_pursuit_sim pure_pursuit_sim.py