# Docker

# What is Docker?
>Docker is a set of platform as a service products that use OS-level virtualization to deliver software in packages called containers. Containers are isolated
# Installation
Docker is available for any plaform whether you have window, mac or linux.
Here are the link for downloading.
https://www.docker.com/get-started/

# Docker Basic Commands
1) Builds a image from Dockerfile in current directory.
```bash
 docker build -t <image_name>
 ```
2) Runs an instance of container with port mapping and bash shell.
```bash
docker run --rm -itd -p 80:5000 <image name>
```
3) Lists all running containers on your system.
```bash
 docker ps
 ```
4) Stops all running instances of containers.
```bash
docker stop $(docker ps -q)
``` 
5) List all the local images
```bash
docker images
```
6) Remove specific image by its ID number
``` bash
docker rmi <image id>
``` 
7) Removes all stopped containers
 ```bash 
docker rm $(docker ps -aq)
``` 
8)Remove all the unused image
```bash
docker image prune
```