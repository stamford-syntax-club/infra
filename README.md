# Infrastructure Configurations

## Stamford Center
### Getting started
Start Dev Environment
```
docker-compose -f stamfordcenter/docker-compose.dev.yaml up -d
```

### Services
#### Prometheus
- This service runs the Prometheus monitoring tool.
- It is responsible for collecting and storing metrics from different components of the SeaweedFS setup.
- The metrics can be accessed through the exposed port 9000.

#### S3
- This service runs the SeaweedFS S3 server.
- The S3 server provides an Amazon S3-compatible interface to interact with 
SeaweedFS.
- It exposes ports 8333 for HTTP communication.
- The Prometheus metrics are exposed on port 9327.
- It depends on s3-master, s3-volume, and s3-filer services to function properly.

#### S3-master
- This service runs the SeaweedFS Master server.
- The master server is responsible for managing the metadata and coordinating the volume servers.
- It exposes ports 9333 for HTTP and 19333 for gRPC communication.
- The Prometheus metrics are exposed on port 9324.

#### S3-volume
- This service runs the SeaweedFS Volume server.
- The volume server stores the actual file data and is managed by the master server.
- It exposes ports 8080 for HTTP and 18080 for gRPC communication.
- The Prometheus metrics are exposed on port 9325.

#### S3-filer
- This service runs the SeaweedFS Filer server.
- The filer server provides the file system-like interface to access the data stored in the volume servers.
- It exposes ports 8888 for HTTP and 18888 for gRPC communication.
- The Prometheus metrics are exposed on port 9326.
- It depends on s3-master and s3-volume services to function properly.

#### S3-webdav:
- This service runs the SeaweedFS WebDAV server.
- The WebDAV server provides a WebDAV-compatible interface to access the data stored in SeaweedFS.
- It exposes port 7333 for HTTP communication.
- It depends on s3-master, s3-volume, and s3-filer services to function properly.
