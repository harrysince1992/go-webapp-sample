pipeline{
    agent any

    stages{
        stage('code checkout'){
            agent {
                docker { 
                    image 'golang:latest' 
                    reuseNode true
                }
            }

            steps {
                sh 'go version'
                echo "Cloning git repo first..."
                git 'https://github.com/harrysince1992/go-webapp-sample.git'
            }
        }

        stage('Test app'){
            agent {
                docker { 
                    image 'golang:latest' 
                    reuseNode true
                }
            }
            steps{
                sh 'go test ./... -v'
            }
        }

        stage('Build'){
            agent any
            steps{
                sh 'docker build -t goapp-docker .'
            }
        }

        stage('Push to docker hub'){
            agent any
            steps {
                sh 'docker tag goapp-docker:latest harrysince1992/go-webapp-sample:latest'
                withDockerRegistry([ credentialsId: "dockerhub-creds", url: "" ]) {
                dockerImage.push("harrysince1992/go-webapp-sample:latest")
                }
            }
        }

    }
}