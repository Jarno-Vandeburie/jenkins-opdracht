pipeline {
  agent any

  stages {
    stage('Checkout') {
        steps {        
            git url: 'https://github.com/Jarno-Vandeburie/jenkins-opdracht.git', branch: 'main'
        }
    }

    stage('Build Docker Container') {
        steps {        
            sh 'docker build -t jarnovandeburie/opdracht-jenkins .'
        }
    }

    stage('Pust to dockerhub') {
        steps {
            sh 'docker push jarnovandeburie/opdracht-jenkins'
        }
    }
  }
}