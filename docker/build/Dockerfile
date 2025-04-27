# Start from the base image
FROM ros-base:noetic

ENV USERNAME=bot
ENV HOME=/home/$USERNAME

# # Use NCHC mirror for Taiwan
# RUN sed -i 's|http://archive.ubuntu.com/ubuntu/|http://free.nchc.org.tw/ubuntu/|g' /etc/apt/sources.list
# 
# RUN apt-get update && apt-get install -y \
#     build-essential \
#     cmake \
#     python3-pip \
#     python3-catkin-tools \
#     && rm -rf /var/lib/apt/lists/*
# 
# # Install additional ROS packages (Network issue in China, normally this is not needed)
# RUN apt-get update -o Acquire::Retries=3 && \
#     apt-get install -y --no-install-recommends \
# # RUN apt-get update && apt-get install -y \
#     ros-noetic-ackermann-msgs \
#     ros-noetic-geometry2 \
#     ros-noetic-hector-gazebo-plugins \
#     ros-noetic-hector-models \
#     ros-noetic-jsk-rviz-plugins \
#     ros-noetic-ros-control \
#     ros-noetic-ros-controllers \
#     ros-noetic-velodyne-simulator \
#     && rm -rf /var/lib/apt/lists/*

# Switch to the 'bot' user for workspace setup
USER $USERNAME
WORKDIR $HOME

# Create the workspace and src directory
RUN mkdir -p $HOME/assignment_ws/src && chown -R bot:bot $HOME/assignment_ws/src

# Clone the workspace repo (ensure the repo structure has a 'src' folder)
RUN git clone https://gitlab.engr.illinois.edu/gemillins/POLARIS_GEM_e2.git $HOME/assignment_ws/src

# Build the workspace using catkin build
RUN /bin/bash -c "source /opt/ros/noetic/setup.bash && cd $HOME/assignment_ws && catkin build -cs"

# Source the workspace setup in the user's bashrc
RUN echo "source $HOME/assignment_ws/devel/setup.bash" >> $HOME/.bashrc

# Set the default shell with the workspace sourced
CMD ["bash"]
