pipeline {
  agent any

    tools {
        dockerTool 'docker'
    }

  stages {
    stage('Checkout') {
        steps {
            echo '---------- start checkout ----------'
        
            git url: 'https://github.com/Jarno-Vandeburie/jenkins-opdracht.git', branch: 'main'

            echo '---------- stop build docker ----------'
        }
    }

    stage('Build Docker Container') {
        steps {
            echo '---------- start build docker ----------'
        
            sh 'docker build -t opdracht-jenkins .'

            echo '---------- stop build docker ----------'
        }
    }
  }
}