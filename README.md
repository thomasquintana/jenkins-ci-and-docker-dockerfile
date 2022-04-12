Jenkins CI with Docker
======================

A container that extends the official Jenkins CI container with Docker.

To build a container with the latest Jenkins CI base image.

```
$] sudo docker build -t q-crew/jenkins:latest .
```

To specifiy a base image with a specific Jenkins CI digest use the `DIGEST` build argument. The following command builds the container for an arm64 platform.

```
$] sudo docker build --build-arg digest="@sha256:443acbdeaf4f30757d07401cdbc1ce48bf4ceea59e6383b7baa1e3a58fde268d" -t q-crew/jenkins:latest .
```

To launch the container with access to Docker on the host. 
```
$] sudo docker container run -d --name jenkins -p 8080:8080 -p 50000:50000 --restart=always -v /srv/jenkins:/var/jenkins_home -v /var/run/docker.sock:/var/run/docker.sock q-crew/jenkins:latest
```
**Note: The jenkins user has to have permission to access the docker socket.**
