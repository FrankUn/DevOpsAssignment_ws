#!/bin/bash

# Source ROS setup
echo "Source ROS setup"
source /opt/ros/noetic/setup.bash

# Source workspace setup
echo "Source workspace setup"
source /home/bot/workspace/my_first_build_pipeline/assignment_ws/devel/setup.bash

# Start the simulation
rosrun gem_pure_pursuit_sim pure_pursuit_sim.py | while read -r line
do
    # Extract Crosstrack Error value using regex (assuming it's always in the format: Crosstrack Error: <value>)
    if [[ "$line" =~ Crosstrack\ Error:\ ([0-9]+\.[0-9]+) ]]; then
        # Capture the error value
        crosstrack_error="${BASH_REMATCH[1]}"
        echo "Crosstrack Error: $crosstrack_error"

        # Check if the Crosstrack Error is greater than 1 meter
        if (( $(echo "$crosstrack_error > 0.5" | bc -l) )); then
            echo "Crosstrack Error exceeds 1m, terminating simulation!"
            # Terminate the simulation by killing the rosrun process
            pkill -f "rosrun gem_pure_pursuit_sim pure_pursuit_sim.py"
            exit 1
        fi
    fi
done
