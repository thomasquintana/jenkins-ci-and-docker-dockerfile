Jenkins CI with Docker
======================

A container that extends the official Jenkins CI container with Docker.

To build a container with the latest Jenkins CI base image.

```
$] sudo docker build -t q-crew/jenkins:latest .
```

To specifiy a base image with a specific Jenkins CI digest.

```
$] sudo docker build --build-arg digest="@sha256:443acbdeaf4f30757d07401cdbc1ce48bf4ceea59e6383b7baa1e3a58fde268d" -t q-crew/jenkins:latest .
```
