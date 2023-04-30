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

        stage('Test app'){
            steps{
                sh 'go test ./... -v'
            }
        }

        stage('Build'){
            steps{
                sh 'go mod download'
                sh 'go mod verify'
                sh 'go build -o go-app'
                sh 'docker build -t goapp-docker .'
            }
        }
    }
}