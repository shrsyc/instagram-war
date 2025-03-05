pipeline {
    agent any
    tools {
        maven 'maven'
    }
    environment {
        TARGET_SERVER = "ansible@172.31.15.150" 
        IMAGE_NAME = "marcos" 
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
                sh 'docker save -o $IMAGE_NAME.tar $IMAGE_NAME' // Save the image as a tar file
            }
        }
        stage("Transfer Docker Image to Ansible Worker") {
            steps {
                sshPublisher(
                    continueOnError: false, 
                    failOnError: true,
                    publishers: [
                        sshPublisherDesc(
                            configName: "ansible-worker", // This should be configured in Jenkins SSH settings
                            transfers: [
                                sshTransfer(sourceFiles: "marcos.tar", removePrefix: "", remoteDirectory: "/home/ansible-user")
                            ],
                            verbose: true
                        )
                    ]
                )
            }
        }
        stage("Deploy Container on Ansible Worker") {
            steps {
                sshPublisher(
                    continueOnError: false, 
                    failOnError: true,
                    publishers: [
                        sshPublisherDesc(
                            configName: "ansible-worker",
                            transfers: [
                                sshTransfer(execCommand: """
                                    docker load -i /home/ansible-user/marcos.tar
                                    docker stop tomcat || true
                                    docker rm tomcat || true
                                    docker run -d -p 8081:8080 --name tomcat marcos
                                """)
                            ],
                            verbose: true
                        )
                    ]
                )
            }
        }
    }
}
