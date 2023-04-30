pipeline{
    agent {
        docker { image 'golang:latest' }
    }

    stages{
        stage('code checkout'){
            steps {
                sh 'go version'
                echo "Cloning git repo first..."
                git 'https://github.com/harrysince1992/go-webapp-sample.git'
            }
        }

        stage('go install'){
            steps{
                sh 'go install github.com/ybkuroki/go-webapp-sample@latest'
            }
        }

        stage('run main app'){
            steps{
                sh 'go run main.go'
            }
        }
    }
}