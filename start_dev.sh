#!/bin/bash

# start haproxy & create stamford network
docker compose -f haproxy/docker-compose.dev.yaml up -d

# start s3 storage services
docker compose -f s3/docker-compose.yaml up -d

# start monitoring services
docker compose -f monitoring/docker-compose.yaml up -d

# start stamford center services (run .dev file)
docker compose -f stamfordcenter/docker-compose.dev.yaml up -d

# start admin services
docker compose -f admin/docker-compose.yaml up -d

# start redis services
docker compose -f redis/docker-compose.yaml up -d

# start portainer services
docker compose -f portainer/docker-compose.yaml up -d
