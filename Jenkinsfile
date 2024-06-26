pipeline {
    agent {
        label 'newagent'
    }
    stages {
        stage ('Build') {
            steps {
                echo "This is first build in jenkins pipeline"
                echo "Running on agent: ${env.NODE_NAME}"
            }
        }
    }
}
