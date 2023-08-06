# Operation Playbook
## Deploy new version
1. Change Image Tag
```yaml
# Example
frontend:
    image: ghcr.io/stamford-syntax-club/stamfordcenter-frontend:<change here>
    restart: always
    networks:
      - stamford
```
### Example
Change the `<change here>` part with the desired tag:
```yaml
frontend:
    image: ghcr.io/stamford-syntax-club/stamfordcenter-frontend:<change here>
    restart: always
    networks:
      - stamford
```

2. Run `./start_dev.sh`

3. Docker should start pulling new images, and recreate the container.


## Remove running services
### Remove specific service in docker-compose file
1. Run `docker compose -f <docker-compose.yaml location> stop <service name>` to stop that service from running.

   Example: `docker compose -f /path/to/docker-compose.yaml stop frontend`

2. Run `docker compose -f <docker-compose.yaml location> rm <service name>` to remove the stopped container.

   Example: `docker compose -f /path/to/docker-compose.yaml rm frontend`

3. Check if the container has been removed successfully via `docker ps -a | grep <service name>` - this deleted service should not show up anymore.

   Example: `docker ps -a | grep frontend`

4. Remove the service from `docker-compose.yaml`.

### Remove all services in docker-compose file
1. Run `docker compose -f <docker-compose.yaml location> down` to stop & remove all services specified in the file.

   Example: `docker compose -f /path/to/docker-compose.yaml down`

2. Check if the container has been removed successfully via `docker ps -a | grep <service name>` - these deleted services should not show up anymore
