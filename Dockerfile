FROM jenkins/jenkins:lts-jdk11

LABEL org.opencontainers.image.authors="thomas.quintana@gmail.com"

# Need root privileges to install Docker.
USER root

RUN set -e; \
    # Install dependencies.
    apt-get update; \
    apt-get upgrade -y; \
    apt-get install ca-certificates \
                    curl \
                    gnupg \
                    lsb-release; \
    # Add Docker’s official GPG key.
    curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo gpg --dearmor -o /usr/share/keyrings/docker-archive-keyring.gpg; \
    # Set up Docker's stable repository
    echo "deb [arch=$(dpkg --print-architecture) signed-by=/usr/share/keyrings/docker-archive-keyring.gpg] https://download.docker.com/linux/ubuntu \
         $(lsb_release -cs) stable" | sudo tee /etc/apt/sources.list.d/docker.list > /dev/null; \
    # Install Docker engine.
    apt-get update; \
    apt-get install docker-ce docker-ce-cli containerd.io;

# Drop back to the regular jenkins user - good practice.
USER jenkins
