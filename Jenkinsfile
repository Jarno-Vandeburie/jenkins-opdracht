pipeline {
  agent any

  stages {
    stage('Checkout') {
      steps {
        echo 'start checkout'
        
        checkout([
            $class: 'GitSCM', 
            branches: [[name: '*/master']], 
            doGenerateSubmoduleConfigurations: false, 
            extensions: [], 
            submoduleCfg: [], 
            userRemoteConfigs: [[credentialsId: null, 
            url: 'https://github.com/Jarno-Vandeburie/jenkins-opdracht.git']]
            ])

        echo 'stop checkout'
      }
    }

    # Build the Docker image using the Dockerfile in the repository
    stage('Build') {
      steps {
        sh 'docker build -t <ORG>/<IMAGE>:latest .'
      }
    }

    # Create a Docker container using the built image
    stage('Create Container') {
      steps {
        sh 'docker create <ORG>/<IMAGE>:latest'
      }
    }

    # Push the Docker container to Docker Hub
    stage('Push') {
      steps {
        sh 'docker push <ORG>/<CONTAINER>:latest'
      }
    }
  }
}