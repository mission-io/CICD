# Jenkins CICD pipeline


this image is jenkins + docker

    mkdir -p /var/jenkins_home
    chown -R 1000:1000 /var/jenkins_home
    docker build -t jenkins-docker
    docker run -d -p 8080:8080 -p 50000:50000 -v /var/jenkins_home:/var/jenkins_home -v /var/run/docker.sock:/var/run/docker.sock --name jenkins jenkins-docker


Note: Base system needs a docker engine.
    
    usermod -aG docker jenkins
    chmod 777 /var/run/docker.sock (this socket share for jenkins container and base images)
