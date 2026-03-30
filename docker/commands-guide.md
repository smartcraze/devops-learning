# Docker Commands Guide

A comprehensive guide to Docker commands for development and production environments.

## Basic Commands

### Container Management
```bash
# Run a container
docker run [options] IMAGE [command]
  -d, --detach        # Run in background
  -p, --publish       # Publish ports
  -v, --volume        # Mount volume
  --name              # Assign name
  --rm                # Remove when stopped

# Example
docker run -d -p 80:80 --name webserver nginx

# List containers
docker ps            # Running containers
docker ps -a         # All containers

# Stop and remove
docker stop CONTAINER
docker rm CONTAINER

# Start/Stop/Restart
docker start CONTAINER
docker stop CONTAINER
docker restart CONTAINER
```

### Image Management
```bash
# List images
docker images

# Pull image
docker pull IMAGE[:TAG]

# Build image
docker build [options] PATH
  -t, --tag          # Name and tag
  -f, --file         # Specify Dockerfile

# Remove image
docker rmi IMAGE

# Clean up
docker system prune  # Remove unused data
docker system prune -a  # Remove all unused data
```

## Container Operations

### Logs and Monitoring
```bash
# View logs
docker logs [options] CONTAINER
  -f, --follow       # Follow log output
  --tail N          # Show last N lines

# Container stats
docker stats [CONTAINER]

# Process list
docker top CONTAINER
```

### Executing Commands
```bash
# Execute command
docker exec [options] CONTAINER COMMAND
  -i, --interactive  # Interactive mode
  -t, --tty         # Allocate pseudo-TTY

# Example
docker exec -it container_name bash
```

### File Operations
```bash
# Copy files
docker cp [options] CONTAINER:SRC_PATH DEST_PATH
docker cp [options] SRC_PATH CONTAINER:DEST_PATH

# Example
docker cp ./local.file container:/app/
```

## Network Management

### Network Commands
```bash
# List networks
docker network ls

# Create network
docker network create [options] NETWORK
  --driver          # Specify network driver
  --subnet          # Subnet in CIDR format

# Connect container
docker network connect NETWORK CONTAINER

# Disconnect container
docker network disconnect NETWORK CONTAINER

# Remove network
docker network rm NETWORK
```

## Volume Management

### Volume Commands
```bash
# List volumes
docker volume ls

# Create volume
docker volume create [options] [VOLUME]

# Inspect volume
docker volume inspect VOLUME

# Remove volume
docker volume rm VOLUME

# Clean up
docker volume prune
```

## Image Management

### Building and Publishing
```bash
# Build image
docker build -t name:tag .

# Tag image
docker tag SOURCE_IMAGE[:TAG] TARGET_IMAGE[:TAG]

# Push to registry
docker push IMAGE[:TAG]

# Pull from registry
docker pull IMAGE[:TAG]
```

## System and Maintenance

### System Commands
```bash
# System information
docker info

# Disk usage
docker system df

# Clean up
docker system prune
docker system prune -a --volumes

# Events
docker events
```

## Docker Compose

### Compose Commands
```bash
# Start services
docker-compose up [options]
  -d                # Detached mode
  --build          # Build images before starting

# Stop services
docker-compose down [options]
  -v               # Remove volumes
  --rmi all       # Remove images

# Other commands
docker-compose ps  # List containers
docker-compose logs  # View logs
docker-compose exec  # Execute command
```

## Advanced Commands

### Inspection and Debugging
```bash
# Inspect container/image
docker inspect CONTAINER|IMAGE

# View port mappings
docker port CONTAINER

# View changes
docker diff CONTAINER
```

### Resource Constraints
```bash
# Memory limits
docker run -m 512m IMAGE

# CPU limits
docker run --cpus=0.5 IMAGE

# Both
docker run -m 512m --cpus=0.5 IMAGE
```

## Best Practices

1. **Resource Management**
- Always set memory and CPU limits
- Use --rm for temporary containers
- Clean up unused resources regularly

2. **Security**
- Use non-root users
- Scan images for vulnerabilities
- Keep base images updated

3. **Logging**
- Use appropriate logging drivers
- Rotate logs
- Monitor container health

4. **Networking**
- Use user-defined networks
- Limit exposed ports
- Use network aliases

5. **Development Workflow**
- Use docker-compose for development
- Use .dockerignore
- Tag images appropriately 