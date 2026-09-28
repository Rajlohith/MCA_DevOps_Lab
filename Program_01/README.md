# Program 1 – Build a Docker Container from a Custom Dockerfile

## Description

The objective of this problem is to build a Docker container from a custom Dockerfile. The container
should package the application and its dependencies to run consistently across environments.

## Project Files

```text
program-1/
├── app.py
├── Dockerfile
├── requirements.txt
└── README.md
```

### Dockerfile Instructions

* `FROM` – Uses Python 3.9 Slim as the base image.
* `LABEL` – Adds information about the Docker image.
* `WORKDIR` – Sets `/app` as the working directory inside the container.
* `COPY` – Copies project files into the container.
* `RUN` – Installs Flask from `requirements.txt`.
* `EXPOSE` – Documents that the application uses port `5000`.
* `CMD` – Starts the Flask application.

## 1. Build the Docker Image

Open the terminal in the project directory and execute:

```bash
docker build -t program-1 .
```

Here:

* `docker build` – Builds a Docker image.
* `-t program-1` – Gives the image the name `program-1`.
* `.` – Uses the current directory as the build context.

To verify the image:

```bash
docker images
```

## 2. Run the Docker Container

Run the container using:

```bash
docker run -d -p 5000:5000 --name flask-container program-1
```

Here:

* `-d` – Runs the container in detached mode.
* `-p 5000:5000` – Maps port `5000` of the host machine to port `5000` inside the container.
* `--name flask-container` – Gives the container the name `flask-container`.
* `program-1` – Specifies the Docker image to use.

To check whether the container is running:

```bash
docker ps
```

## 3. Test the Application

Open a web browser and visit:

```text
http://localhost:5000
```

The following message should be displayed:

```text
Hello, Docker!
```

## 4. Stop the Container

First, list all containers:

```bash
docker container ls -a
```

Then stop the container using either its container ID or name:

```bash
docker container stop flask-container
```

or:

```bash
docker container stop <container-id>
```

## 5. Remove the Container

After stopping the container, remove it using:

```bash
docker container rm flask-container
```

or:

```bash
docker container rm <container-id>
```

## 6. Remove the Docker Image

To delete the Docker image:

```bash
docker image rm program-1
```

If the container has already been removed, the image can be deleted successfully.

## 7. Complete Cleanup

To stop the container, remove it, and delete the Docker image:

```bash
docker container ls -a
docker container stop flask-container
docker container rm flask-container
docker image rm program-1
```

Alternatively, the container can be stopped and removed using:

```bash
docker stop flask-container
docker rm flask-container
```

Then remove the image:

```bash
docker rmi program-1
```

## 8. Useful Docker Commands

### List running containers

```bash
docker ps
```

### List all containers

```bash
docker ps -a
```

### List Docker images

```bash
docker images
```

### View container logs

```bash
docker logs flask-container
```

### Stop container

```bash
docker stop flask-container
```

### Remove container

```bash
docker rm flask-container
```

### Remove image

```bash
docker rmi program-1
```

## Expected Output

After running the container and opening:

```text
http://localhost:5000
```

the browser should display:

```text
Hello, Docker!
```
