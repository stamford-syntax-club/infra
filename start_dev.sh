#!/bin/bash

# start haproxy & create stamford network
docker compose -f haproxy/docker-compose.dev.yaml up -d

# start s3 storage services
docker compose -f s3/docker-compose.dev.yaml up -d

# start prometheus services
docker compose -f prometheus/docker-compose.dev.yaml up -d

# start stamford center services
docker compose -f stamfordcenter/docker-compose.dev.yaml up -d

# start onboarding docs services
docker compose -f onboarding/docker-compose.dev.yaml up -d