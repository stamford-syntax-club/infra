#!/bin/bash

# stop stamford center services (stop .prod file)
docker compose -f stamfordcenter/docker-compose.prod.yaml down -v

# stop s3 storage services
docker compose -f s3/docker-compose.yaml down -v 

# stop monitoring services
docker compose -f monitoring/docker-compose.yaml down -v

# stop redis services
docker compose -f redis/docker-compose.yaml down -v

# stop admin services
docker compose -f admin/docker-compose.yaml down -v

# stop onboarding services
docker compose -f onboarding/docker-compose.prod.yaml down -v

# stop portainer services
docker compose -f portainer/docker-compose.yaml down -v

# stop haproxy & destroy stamford network
docker compose -f haproxy/docker-compose.prod.yaml down -v

# start kafka services
docker compose -f kafka/docker-compose.yaml down -v 

# start course compose services
docker compose -f coursecompose/docker-compose.prod.yaml down -v 
