pipeline {
  agent any

  stages {
    stage('Checkout') {
        steps {
            echo '---------- start checkout ----------'
        
            git url: 'https://github.com/Jarno-Vandeburie/jenkins-opdracht.git', branch: 'main'

            echo '---------- stop checkout ----------'
        }
    }

    stage('Build Docker Container') {
        steps {
            echo '---------- start build docker ----------'
        
            sh 'cat /os-release'
            sh 'docker build -t jarnovandeburie/opdracht-jenkins .'

            echo '---------- stop build docker ----------'
        }
    }

    stage('Pust to dockerhub') {
        steps {
            echo '---------- start push docker ----------'

            sh 'docker push jarnovandeburie/opdracht-jenkins'

            echo '---------- stop push docker ----------'
        }
    }
  }
}