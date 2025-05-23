#!/bin/bash
FAIL_CRITERIA=1

# Source ROS setup
echo "Source ROS setup"
source /opt/ros/noetic/setup.bash

# Source workspace setup
echo "Source workspace setup"
source assignment_ws/devel/setup.bash

echo "The fail criteria is set to be crosstrack error greater than $FAIL_CRITERIA meter"

# Start the simulation
rosrun gem_pure_pursuit_sim pure_pursuit_sim.py | while read -r line
do
    # Extract Crosstrack Error value using regex (assuming it's always in the format: Crosstrack Error: <value>)
    if [[ "$line" =~ Crosstrack\ Error:\ ([0-9]+\.[0-9]+) ]]; then
        # Capture the error value
        crosstrack_error="${BASH_REMATCH[1]}"
        echo "Crosstrack Error: $crosstrack_error"

        # Get the absolute value of the Crosstrack Error
        abs_crosstrack_error=$(echo "$crosstrack_error" | awk '{print ($1 < 0) ? -$1 : $1}')

        echo "Absolute Crosstrack Error: $abs_crosstrack_error"

        # Check if the absolute Crosstrack Error is greater than the failure threshold using awk
        result=$(echo "$abs_crosstrack_error $FAIL_CRITERIA" | awk '{if ($1 > $2) print 1; else print 0}')
        
        if [ "$result" -eq 1 ]; then
            echo "Absolute Crosstrack Error exceeds $FAIL_CRITERIA m, terminating simulation!"
            # Terminate the simulation by killing the rosrun process
            pkill -f "rosrun gem_pure_pursuit_sim pure_pursuit_sim.py"
            exit 1
        fi
    fi
done
