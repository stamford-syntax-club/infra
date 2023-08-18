#!/bin/bash

# stop stamford center services
docker compose -f stamfordcenter/docker-compose.dev.yaml down

# stop s3 storage services
docker compose -f s3/docker-compose.dev.yaml down

# stop monitoring services
docker compose -f monitoring/docker-compose.dev.yaml down

# stop haproxy & destroy stamford network
docker compose -f haproxy/docker-compose.dev.yaml down