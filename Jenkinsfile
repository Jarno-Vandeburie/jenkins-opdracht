pipeline {
  agent any

  stages {
    stage('Checkout') {
        steps {
            echo '---------- start checkout ----------'
        
            git url: 'https://github.com/Jarno-Vandeburie/jenkins-opdracht.git', branch: 'main'

            echo '---------- stop checkout ----------'
        }
    }

    stage('Install docker'){
        steps {
            sh 'docker exec -it --workdir /root --user root 0766 bash'
            sh 'apt update -y'
            sh 'apt install -y apt-transport-https ca-certificates curl software-properties-common'
            sh 'curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo apt-key add -'
            sh 'add-apt-repository "deb [arch=amd64] https://download.docker.com/linux/ubuntu $(lsb_release -cs) stable"'
            sh 'apt update'
            sh 'apt install -y docker-ce'
            sh 'systemctl start docker'
        }
    }

    stage('Build Docker Container') {
        steps {
            echo '---------- start build docker ----------'
        
            sh 'docker build -t jarnovandeburie/opdracht-jenkins .'

            echo '---------- stop build docker ----------'
        }
    }

    stage('Pust to dockerhub') {
        steps {
            echo '---------- start push docker ----------'

            sh 'docker push jarnovandeburie/opdracht-jenkins'

            echo '---------- stop push docker ----------'
        }
    }
  }
}