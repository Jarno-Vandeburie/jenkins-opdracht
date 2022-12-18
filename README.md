
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

Maak een *multiline pipline* job aan en selecteer *git* bij de branch sources