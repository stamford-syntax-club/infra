# Operation Playbook
## Deploy new version
1. Change Image Tag
```yaml
#example
frontend:
    image: ghcr.io/stamford-syntax-club/stamfordcenter-frontend:<change here>
    restart: always
    networks:
      - stamford
```

2. Run `./start_dev.sh`

3. Docker should start pulling new images, and recreate the container


## Remove running services
### Remove specific service in docker-compose file
1. Run `docker compose -f <docker-compose.yaml location> stop <service name>` to stop that service from runnning

2. Run `docker compose -f <docker-compose.yaml location> rm <service name>` to remove the stopped container

3. Check if the container has been removed successfully via `docker ps -a | grep <service name>` - this deleted service should not be shown up anymore

4. Remove the service from `docker-compose.yaml`

### Remove all services in docker-compose file
1. Run `docker compose -f <docker-compose.yaml location down` to stop & remove all services specified in the file

2. Check if the container has been removed successfully via `docker ps -a | grep <service name>` - this deleted services should not be shown up anymore
