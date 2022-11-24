pipeline {
    agent any
    environment {
        DOCKERHUB_CREDENTIALS = credentials('cl0ud-dockerhub')
    }
    stages {
        stage('SCM Checkout') {
            steps{
                git 'https://github.com/chis0m/p-20-docker-php-todo-app.git'
            }
        }

        stage('Setup .env file') {
            steps {
                sh 'cp src/.env.example src/.env'
            }
        }

        stage('Build docker image') {
            steps {
                sh 'docker build -t cl0ud/todoapp:$BUILD_NUMBER -f php.dockerfile .'
            }
        }
        stage('login to dockerhub') {
            steps{
                sh 'echo $DOCKERHUB_CREDENTIALS_PSW | docker login -u $DOCKERHUB_CREDENTIALS_USR --password-stdin'
            }
        }
        stage('push image') {
            steps{
                sh 'docker push cl0ud/todoapp:$BUILD_NUMBER'
            }
        }
}
post {
        always {
            sh 'docker logout'
        }
    }
}
