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

    stage('Push image') {
      steps {
        sh 'docker login -u jarnovandeburie -p r0950712-docker'
        sh 'docker push jarnovandeburie/opdracht-jenkins'
      }
    }
  }
}