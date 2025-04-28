# DevOpsAssignment_ws
## Overview

This repository contains the setup for a Docker-based development environment as part of the DevOps assignment. It includes configurations for Jenkins CI/CD pipelines, Dockerfiles for building application images, and scripts to automate the setup process.


## Setup Instructions

### Prerequisites

Ensure the following are installed on your machine:

- Docker

### Building the Docker Image

Navigate to the `docker/build` directory and build the Docker image using the following command:

```bash
./build.sh
```

**To change the version of Java (default as Java11) installed in the Docker image, modify the Dockerfile in `docker` directory accordingly**

## Using Docker Compose to Test the Image
1. Navigate to the `docker` directory
2. Use the following command to start the container using Docker Compose:

    ```bash
    docker compose up -d
    ```
3. Use the following command to access the docker container
    ```bash
    docker exce -it assignment bash
    ```
4. Create the caktin_ws and clone the `POLARIS_GEM_e2` code from GitLab
    ```bash
    mkdir -p catkin_ws/src && \
    git clone https://gitlab.engr.illinois.edu/gemillins/POLARIS_GEM_e2 catkin_ws/src && \
    cd catkin_ws && catkin build -cs && source devel/setup.bash
    ```
5. launch the gazebo world and rviz
    ```bash
    roslaunch gem_gazebo gem_gazebo_rviz.launch velodyne_points:="true"
    ```

### Reminder:
The URDF file in the `POLARIS_GEM_e2` package is not fully configured for the simulation environment. Specifically, the joint and link for the 3D LiDAR are incorrect. To properly display the point cloud in RViz, you need to add a custom link named `gem_velodyne` and the corresponding joint to the URDF file.