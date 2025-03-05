pipeline {
    agent any
    tools {
        maven 'maven'
    }
    environment {
        IMAGE_NAME = "marcos"
        WORKER_NODE = "172.31.15.150"  // Private IP of the worker node
        ANSIBLE_USER = "ansible"       // SSH user for Ansible
    }
    stages {
        stage("Pull SRC") {
            steps {
                git 'https://github.com/shrsyc/instagram-war.git'
            }
        }
        stage("Build with Maven") {
            steps {
                sh 'mvn clean package'
            }
        }
        stage("Build Docker Image") {
            steps {
                sh 'docker build -t $IMAGE_NAME .'
                sh 'docker save -o $IMAGE_NAME.tar $IMAGE_NAME'  // Save image as a tar file
            }
        }
        stage("Transfer Image to Worker Node") {
            steps {
                sshPublisher(
                    continueOnError: false, 
                    failOnError: true,
                    publishers: [
                        sshPublisherDesc(
                            configName: "ansible", // Should be configured in Jenkins SSH settings
                            transfers: [
                                sshTransfer(sourceFiles: "$IMAGE_NAME.tar", removePrefix: "", remoteDirectory: "/home/$ANSIBLE_USER")
                            ],
                            verbose: true
                        )
                    ]
                )
            }
        }
        
    }
}
