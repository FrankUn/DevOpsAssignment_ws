#!/bin/bash

# Source ROS setup.bash
source /opt/ros/noetic/setup.bash

# Create workspace and clone the repo
mkdir -p assignment_ws/src
git clone https://gitlab.engr.illinois.edu/gemillins/POLARIS_GEM_e2.git assignment_ws/src

# Build the workspace using catkin
cd assignment_ws
catkin build -cs
