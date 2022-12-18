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
        withCredentials([usernamePassword(credentialsId: 'dockerhub', passwordVariable: 'r0950712-docker', usernameVariable: 'jarnovandeburie')]) {
          sh 'docker login -u $DOCKER_USERNAME -p $DOCKER_PASSWORD'
          sh 'docker push opdracht-jenkins'
        }
      }
    }
  }
}