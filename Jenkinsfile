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
                chmod +x ./setup_workspace.sh
                ./setup_workspace.sh
                '''
            }
        }
        stage('launch the simulation') {
            steps {
                echo "Launching gazebo and rviz..."
                sh '''
                roslaunch gem_gazebo gem_gazebo_rviz.launch
                '''
            }
        }
        stage('Simulation Start') {
            steps {
                echo "Simulation Start!"
                sh '''
                rosrun gem_pure_pursuit_sim pure_pursuit_sim.py
                '''
            }
        }
    }
}