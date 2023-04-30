pipeline{
    agent any

    environment {
        DOCKERHUB_CREDS=credentials('dockerhub-creds')
    }

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
                sh 'docker build -t go-webapp-docker .'
            }
        }

        stage('dockerhub login'){
            agent any
            steps {
                withCredentials([string(credentialsId: 'dockerhub-passwd', variable: 'dockerpwd')]) {
                    sh "docker login -u harrysince1992 -p ${dockerpwd}"
                }
            }
        }

        stage('tag and push image'){
            steps {
                sh 'docker tag go-webapp-docker:latest harrysince1992/go-webapp-sample:latest'
                sh 'docker push harrysince1992/go-webapp-sample:latest'
            }
        }

        stage('Deploy webapp'){
            agent any
            steps {
                sh 'docker run -p 8081:8081 -d --rm harrysince1992/go-webapp-sample:latest'
                sh 'App is up and running fine' 
            }
        }

    }
}