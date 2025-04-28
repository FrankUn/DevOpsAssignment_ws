#!/bin/bash
FAIL_CRITERIA=0.5

# Source ROS setup
echo "Source ROS setup"
source /opt/ros/noetic/setup.bash

# Source workspace setup
echo "Source workspace setup"
source /home/bot/workspace/my_first_build_pipeline/assignment_ws/devel/setup.bash

echo "The fail criteria is set to be crosstrack error greater than $FAIL_CRITERIA meter"

# Start the simulation and capture the process ID (PID)
rosrun gem_pure_pursuit_sim pure_pursuit_sim.py &
ROS_PID=$!

# Monitor the output and check for Crosstrack Error
tail -f /dev/null | while read -r line
do
    # Extract Crosstrack Error value using regex
    if [[ "$line" =~ Crosstrack\ Error:\ ([0-9]+\.[0-9]+) ]]; then
        crosstrack_error="${BASH_REMATCH[1]}"
        echo "Crosstrack Error: $crosstrack_error"

        # Get the absolute value of the Crosstrack Error
        abs_crosstrack_error=$(echo "$crosstrack_error" | awk '{print ($1 < 0) ? -$1 : $1}')
        echo "Absolute Crosstrack Error: $abs_crosstrack_error"

        # Compare the Crosstrack Error against the threshold
        result=$(echo "$abs_crosstrack_error $FAIL_CRITERIA" | awk '{if ($1 > $2) print 1; else print 0}')
        
        if [ "$result" -eq 1 ]; then
            echo "Absolute Crosstrack Error exceeds $FAIL_CRITERIA m, terminating simulation!"
            # Cleanly terminate the simulation by killing the rosrun process
            kill $ROS_PID
            wait $ROS_PID
            exit 1
        fi
    fi
done