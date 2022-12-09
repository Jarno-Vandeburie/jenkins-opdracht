pipeline {
  agent any

  stages {
    stage('Build') {
      steps {
        echo 'start build'
        
        git url: 'https://github.com/Jarno-Vandeburie/jenkins-opdracht.git', branch: 'main'

        echo 'stop build'
      }
    }
  }
}