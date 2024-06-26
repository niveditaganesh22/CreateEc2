pipeline {
    agent {
        label 'newagent'
    }
    stages {
        stage('Build on agent') {
            steps {
                echo "This is the first build in Jenkins pipeline"
                echo "Running on agent: ${env.NODE_NAME}"
            }
        }
        stage('Terraform Install On Jenkins Node') {
            steps {
                sh 'echo "This is Jenkins Pipeline"'
                sh 'sudo apt-get update'
                sh 'sudo apt-get install -y gnupg software-properties-common'
                sh 'wget -O- https://apt.releases.hashicorp.com/gpg | gpg --dearmor | sudo tee /usr/share/keyrings/hashicorp-archive-keyring.gpg > /dev/null'
                sh 'gpg --no-default-keyring --keyring /usr/share/keyrings/hashicorp-archive-keyring.gpg --fingerprint'
                sh 'echo "deb [signed-by=/usr/share/keyrings/hashicorp-archive-keyring.gpg] https://apt.releases.hashicorp.com $(lsb_release -cs) main" | sudo tee /etc/apt/sources.list.d/hashicorp.list'
                sh 'sudo apt update'
                sh 'sudo apt-get install terraform -y'
            }
        }
        stage ('Find  Terraform Version') {
            steps {
                sh 'terraform -version'
            }
        }
        stage ('Terraform Initilization') {
            steps {
                sh 'terraform init'
            }
        }
        stage ('Terraform Plan') {
            steps {
                sh 'terraform plan'
            }
        }
        stage ('Terraform Apply') {
            steps {
                sh 'terraform apply --auto-approve'
            }
        }
        stage ('Approval to Destroy'){
            steps {
                input message: 'Approve to Destroy', ok: 'Destroy'
            }
        }
        stage ('Terraform Destroy') {
            steps {
                sh 'terraform destroy --auto-approve'
            }
        }
    }
}
