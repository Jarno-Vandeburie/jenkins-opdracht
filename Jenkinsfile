pipeline {
  agent any

  stages {
    stage('Checkout git') {
      steps {
        echo '---------- start checkout ----------'
        
        git 'https://github.com/Jarno-Vandeburie/jenkins-opdracht.git'

        echo '---------- stop checkout ----------'
      }
    }

    stage('Build Docker Container') {
            steps {
                echo '---------- start checkout ----------'
        
                sh 'docker build -t opdracht-jenkins .'

                echo '---------- stop checkout ----------'
            }
        }
  }
}