pipeline {
    agent { 
        node {
            label 'ros-noetic'
            }
      }
    triggers {
        pollSCM '* * * * *'
    }
    stages {
        stage('setup caktin workspace') {
            steps {
                echo "Catkin Workspace Setup...."
                sh '''
                # Ensure script is executable and then run it
                chmod +x ./scripts/setup_workspace.sh
                ./scripts/setup_workspace.sh
                '''
            }
        }
        stage('launch the simulation') {
            steps {
                echo "Launching gazebo and rviz..."
                sh '''
                # Ensure script is executable and then run it
                chmod +x ./scripts/launch_simulation_world.sh
                ./scripts/launch_simulation_world.sh
                '''
            }
        }
        stage('Simulation Start') {
            steps {
                echo "Simulation Start!"
                sh '''
                # Ensure script is executable and then run it
                chmod +x ./scripts/start_simulation.sh
                ./scripts/start_simulation.sh
                '''
            }
        }
    }
}