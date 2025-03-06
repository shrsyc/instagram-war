pipeline{
    agent any
    stages{
        stage("pull src"){
            steps{
                git 'https://github.com/shrsyc/instagram-war.git'
            }
        }
        stage("terraform init"){
            steps{
                sh 'terraform init'
            }
        }
        stage("terraform validate"){
            steps{
                sh 'terraform validate'
            }
        }
        stage("terraform plan"){
            steps{
                sh 'TF_VAR_aws_access_key= TF_VAR_aws_secret_key= terraform plan'
            }
        }
        stage("terraform apply"){
            steps{
                sh 'TF_VAR_aws_access_key= TF_VAR_aws_secret_key= terraform apply --auto-approve'
            }
        }
    }
}
