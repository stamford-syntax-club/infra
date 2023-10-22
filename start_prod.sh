#!/bin/bash

# start haproxy & create stamford network
docker compose -f haproxy/docker-compose.prod.yaml up -d

# start s3 storage services
docker compose -f s3/docker-compose.yaml up -d

# start prometheus services
docker compose -f prometheus/docker-compose.yaml up -d

# start stamford center services (run .prod file)
docker compose -f stamfordcenter/docker-compose.prod.yaml up -d

# start redis services
docker compose -f redis/docker-compose.yaml up -d

# start admin services
docker compose -f admin/docker-compose.yaml up -d

# start onboarding services
docker compose -f onboarding/docker-compose.prod.yaml up -d

# start portainer services
docker compose -f portainer/docker-compose.yaml up -d