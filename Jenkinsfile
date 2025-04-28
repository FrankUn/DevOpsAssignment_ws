pipeline {
    agent { 
        node {
            label 'ros-noetic'
            }
      }
    // triggers {
    //     pollSCM '* * * * *'
    // }
    environment {
        // Define recipient list for email notifications
        EMAIL_RECIPIENTS = 'uniekun1@gmail.com'
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
    post {
        success {
            emailext(
                subject: "Jenkins Pipeline Successful",
                body: "The pipeline completed successfully.",
                to: "${EMAIL_RECIPIENTS}"
            )
        }
        failure {
            emailext(
                subject: "Jenkins Pipeline Failed",
                body: "The pipeline failed. Please check the logs for more details.",
                to: "${EMAIL_RECIPIENTS}"
            )
        }
        unstable {
            emailext(
                subject: "Jenkins Pipeline Unstable",
                body: "The pipeline was unstable. Please review the results.",
                to: "${EMAIL_RECIPIENTS}"
            )
        }
    }
}