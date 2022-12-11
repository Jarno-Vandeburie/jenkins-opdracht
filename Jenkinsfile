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

    stage('Install docker') {
      steps {
        sh 'su -'
        sh 'root'
        sh 'apt update -y'
        sh 'apt install -y docker.io'
        sh 'systemctl start docker'
      }
    }

    stage('Build Docker Image') {
      steps {
        sh 'echo root | su -'
        sh 'docker build -t opdracht-jenkins .'
      }
    }

    stage('Deploy') {
      steps {
        sh 'docker run -p 8080:8080 -p 50000:50000 opdracht-jenkins'
      }
    }

    stage('Push to Docker Hub') {
      steps {
        sh 'docker login -u your-username -p your-password'
        sh 'docker push your-username/your-image-name'
      }
    }
  }
}
