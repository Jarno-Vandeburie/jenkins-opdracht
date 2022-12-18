
# Jenkins container

Begin met het aanmaken van de Dockerfile om een jenkins container te starten:

```
FROM jenkins/jenkins:lts
USER root
RUN apt-get -y update && \
    apt-get install -y apt-transport-https ca-certificates curl gnupg2 software-properties-common
RUN curl -fsSL https://download.docker.com/linux/debian/gpg | apt-key add
RUN add-apt-repository \
    "deb [arch=amd64] https://download.docker.com/linux/debian \
    $(lsb_release -cs) \
    stable"

RUN apt-get update && \
    apt-get -y install docker-ce docker-ce-cli containerd.io

RUN usermod -aG docker jenkins
```

In de folder van de Dockerfile, gebruik `docker build -t jenkins-container .` om de image aan te maken en hem de naam `jenkins-container` te geven.

Om de container aan te maken en te gebruiken moeten de poorten 8080 en 50000 toegewezen worden.
`docker run -p 8080:8080 -p 50000:50000 -d -v jenkins_home:/var/jenkins_home jenkins-container`

Dit commando geeft het id terug van de aangemaakte container, verder in de documentatie zal XYZ worden gebruikt als id.

# Jenkins configureren
Surf naar http://localhost:8080/
Het wachtwoord kan verkregen worden aan de hand van `docker exec XYZ cat /var/jenkins_home/secrets/initialAdminPassword`
Dit voert het "cat" commando uit op de docker

Installeer de voorgestelde plugins

Maak een *multiline pipline* job aan en selecteer *git* bij de branch sources. Vul de git link in.

Vink *Periodically if not otherwise run* aan in de *Scan multibrach pipeline triggers* sectie en kies voor *15 minutes*. Dit zal om de 15 minuten de pipeline activeren.

# Dockerfile
Maak een folder en plaats er een Dockerfile in, dit zal de dockerfile zijn voor de nodejs container.
```
FROM node

RUN mkdir -p /usr/src/app

WORKDIR /usr/src/app

RUN npm install -y express

COPY ./api .

EXPOSE 3000

CMD ["node", "app.js"]
```

In die folder, maak een subfolder *api* aan en creëer daar een file *app.js* in aan. Deze javascript file zal voor de api zorgen.

Push de root folder naar github.

# Jenkinsfile voor de node container
Als laatste moet de root folder ook een jenkinsfile bevatten. Deze zal worden uitgevoerd wanneer de pipeline start.

Deze jenkinsfile zal 3 stappen bevatten:
- Het clonen van de github repository
- Het aanmaken van de docker image
- Het pushen van de image naar dockerhub

```
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
          userRemoteConfigs: [[url: '<GITHUB REPO>*']]
        ])
      }
    }

    stage('Build Docker Image') {
      steps {
        sh 'docker build -t <USERNMAE>/<IMAGE> .'
      }
    }

    stage('Push image') {
      steps {
        sh 'docker login -u <USERNAME> -p <PASSWORD>'
        sh 'docker push <USERNMAE>/<IMAGE>'
      }
    }
  }
}
```
