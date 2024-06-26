pipeline {
    agent {
        label 'newagent'
    }
    stages {
        stage ('Build on agent') {
            steps {
                echo "This is first build in jenkins pipeline"
                echo "Running on agent: ${env.NODE_NAME}"
            }
            stage ('Terraform Install On Jenkins Node') {
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
        }
    }
}
