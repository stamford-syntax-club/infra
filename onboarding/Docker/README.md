# Docker

# What is Docker?
>Docker is a set of platform as a service products that use OS-level virtualization to deliver software in packages called containers. Containers are isolated
# Installation
Docker is available for any plaform whether you have window, mac or linux.
Here are the link for downloading.
https://www.docker.com/get-started/

# Docker Basic Commands
1) docker build -t <image_name> . (Builds a image from Dockerfile in current directory.)
2) docker run --rm -itd -p 80:5000 <image name> /bin/bash (Runs an
instance of container with port mapping and bash shell.)
3) docker ps (Lists all running containers on your system.)
4) docker stop $(docker ps -q) (Stops all running instances of containers.)
5) docker images (List all the local images)
6) docker rmi <image id> (Remove specific image by its ID number).
7) docker rm $(docker ps -aq) (Removes all stopped containers)
8) docker image prune (Remove all the unused images)