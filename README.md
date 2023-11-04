# Stamford Syntax Club - Server Infrastructure

This repository consits of all configurations related to Server Infrastructure in Stamford Syntax Club

## Prerequsites

- Docker
- AWS CLI - then type `aws configure` in the terminal and enter anything
- .env file consisting of `DISCORD_WEBHOOK_URL= <discord webhook url>`

_NOTE:_ discord webhook url retrieval steps can be found in `/prometheus/README.md`

## Getting started

Bootstrap development server:

```bash
chmod +x ./start_dev.sh && ./start_dev.sh
```

Teardown development server

```bash
chmod +x ./stop_dev.sh && ./stop_dev.sh
```

## Services

The entire infrastructure is currently orchestrated using Docker containers, organized into multiple docker-compose files. This setup ensures seamless deployment and maintains a consistent environment throughout the system.

Current services offered:

- HAProxy
- Prometheus
- S3
- StamfordCenter

### HAProxy

- HAProxy is our reverse-proxy and will soon be used for load balancing as we scale up
- When received traffic from cloudflare, it terminates the SSL certificate and redirect the http request to different services depending on the subdomain.
- `center.stamford.dev` directs to the frontend of StamfordCenter
- `prometheus.stamford.dev` directs to the Prometheus service

### Prometheus

- [Prometheus](https://prometheus.stamford.dev) is a time-series database that we use to collect metrics emitted from our services like S3

### S3

- S3 is our object store system, we use SeaweedFS S3 to store any files/images used in our website.

### StamfordCenter

- [StamfordCenter](https://center.stamford.dev) serves as a convenient, all-in-one platform catering to the needs of Stamford students. It offers easy access to essential Stamford sites, including reg.stamford.edu, along with a plethora of valuable resources such as general request forms, academic calendars, and more.

## Bounded Ports

|  PORT | SERVICE                                                          |
| ----: | :--------------------------------------------------------------- |
|    80 | HAProxy                                                          |
|  1341 | Appsmith                                                         |
|  1342 | Portainer UI                                                     |
|  7333 | S3-webdav service (SeaweedFS WebDAV server)                      |
|  8181 | S3-volume service (SeaweedFS Volume server - HTTP API)           |
|  8333 | S3 service (SeaweedFS S3 server)                                 |
|  8404 | HAProxy Prometheus Port                                          | 
|  8888 | S3-filer service (SeaweedFS Filer server - HTTP API)             |
|  9000 | Prometheus service                                               |
|  9093 | AlertManager service                                             |
|  9094 | Discord-Alert service (Internal)                                 |
|  9325 | S3-volume service (SeaweedFS Volume server - Prometheus metrics) |
|  9333 | S3-master service (SeaweedFS Master server - HTTP API)           |
| 18080 | S3-volume service (SeaweedFS Volume server - gRPC communication) |
| 18888 | S3-filer service (SeaweedFS Filer server - gRPC communication)   |
| 19333 | S3-master service (SeaweedFS Master server - gRPC communication) |
