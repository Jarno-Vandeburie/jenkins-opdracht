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
            userRemoteConfigs: [[credentialsId: '405120d0-c570-4c0f-bb64-7e4bada291d0', 
            url: 'https://github.com/Jarno-Vandeburie/jenkins-opdracht.git']]
            ])

        echo 'stop checkout'
      }
    }
  }
}