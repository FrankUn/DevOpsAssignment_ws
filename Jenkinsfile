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
                source /opt/ros/noetic/setup.bash
                mkdir -p assignment_ws/src
                git clone https://gitlab.engr.illinois.edu/gemillins/POLARIS_GEM_e2.git assignment_ws/src
                cd assignment_ws
                catkin build -cs
                source devel/setup.bash
                '''
            }
        }
    }
}