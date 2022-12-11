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

    stage('Give user permissions') {
      steps {
        sh 'echo root | sudo -S su -'
        sh 'usermod -a -G docker jenkins'
      }
    }

    stage('Build Docker Image') {
      steps {
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
