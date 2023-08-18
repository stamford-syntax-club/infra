#!/bin/bash

# start haproxy & create stamford network
docker compose -f haproxy/docker-compose.dev.yaml up -d

# start s3 storage services
docker compose -f s3/docker-compose.dev.yaml up -d

# start monitoring services
docker compose -f monitoring/docker-compose.dev.yaml up -d

# start stamford center services
docker compose -f stamfordcenter/docker-compose.dev.yaml up -d