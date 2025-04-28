# --- Start from the base ROS image ---
FROM ros-base:noetic

# --- Set environment variables for user and home directory ---
ENV USERNAME=bot
ENV HOME=/home/$USERNAME

# -------------------------------------------------
# Install Java 17 (for remoting.jar that needs class version 61.0)
# RUN apt-get update && apt-get install -y openjdk-17-jdk

# -------------------------------------------------
# (Optional) If you needed Java 11 instead, you could do this:
RUN apt-get update && apt-get install -y openjdk-11-jdk
# -------------------------------------------------
    
# --- Switch to the 'bot' user for workspace setup ---
USER $USERNAME
WORKDIR $HOME

# # --- Create the catkin workspace directory ---
# RUN mkdir -p $HOME/assignment_ws/src && chown -R $USERNAME:$USERNAME $HOME/assignment_ws/src
# 
# # --- Clone the workspace repository ---
# # (Make sure the repo has a correct 'src' layout inside)
# RUN git clone https://gitlab.engr.illinois.edu/gemillins/POLARIS_GEM_e2.git $HOME/assignment_ws/src
# 
# # --- Build the workspace using catkin build ---
# RUN /bin/bash -c "source /opt/ros/noetic/setup.bash && cd $HOME/assignment_ws && catkin build -cs"
# 
# # --- Source the workspace setup script automatically in bash sessions ---
# RUN echo "source $HOME/assignment_ws/devel/setup.bash" >> $HOME/.bashrc

# --- Set default command ---
CMD ["bash"]

