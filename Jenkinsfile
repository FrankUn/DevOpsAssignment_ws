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
    }
}