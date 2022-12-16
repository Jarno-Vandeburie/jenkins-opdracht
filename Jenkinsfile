pipeline {
  agent any

  stages {
    stage('Clone') {
      steps {
        checkout([
          $class: 'GitSCM',
          branches: [[name: '*/main']],
          doGenerateSubmoduleConfigurations: false,
          extensions: [],
          submoduleCfg: [],
          userRemoteConfigs: [[url: 'https://github.com/Jarno-Vandeburie/jenkins-opdracht.git']]
        ])
      }
    }

    stage('Build Docker Image') {
      steps {
        sh 'docker build -t opdracht-jenkins .'
      }
    }

    stage('Push to Docker Hub') {
      steps {
        withDockerRegistry([credentialsId: 'efa347b3-1cbb-4a40-a33e-4704ce7c5f2a', url: 'https://hub.docker.com/u/jarnovandeburie']) {
          sh '''
                        docker push opdracht-jenkins:latest
                    '''
        }
      }
    }
  }
}