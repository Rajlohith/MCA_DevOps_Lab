
FROM jenkins/jenkins:lts

# Switch to root to install Docker CLI
USER root

RUN apt-get update && \
    apt-get install -y docker.io && \
    apt-get clean && \
    rm -rf /var/lib/apt/lists/*

# Switch back to Jenkins user
USER jenkins

docker compose up -d --build
docker exec jenkins-ci cat /var/jenkins_home/secrets/initialAdminPassword
