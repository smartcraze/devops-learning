# Docker Compose Guide

Docker Compose is a tool for defining and running multi-container Docker applications.

## Basic docker-compose.yml Structure

```yaml
version: '3.8'

services:
  web:
    build: .
    ports:
      - "3000:3000"
    environment:
      - NODE_ENV=production
    depends_on:
      - db
      - redis

  db:
    image: postgres:13
    volumes:
      - postgres_data:/var/lib/postgresql/data
    environment:
      - POSTGRES_USER=myapp
      - POSTGRES_PASSWORD=secret
      - POSTGRES_DB=myapp

  redis:
    image: redis:6-alpine
    volumes:
      - redis_data:/data

volumes:
  postgres_data:
  redis_data:

networks:
  backend:
    driver: bridge
```

## Common Configurations

### Building Images
```yaml
services:
  app:
    build:
      context: .
      dockerfile: Dockerfile
      args:
        - NODE_ENV=production
```

### Environment Variables
```yaml
services:
  web:
    env_file:
      - .env
    environment:
      - API_KEY=secret
      - DEBUG=0
```

### Volumes
```yaml
services:
  db:
    volumes:
      # Named volume
      - db_data:/var/lib/mysql
      # Bind mount
      - ./init.sql:/docker-entrypoint-initdb.d/init.sql
      # Anonymous volume
      - /var/lib/mysql

volumes:
  db_data:
    driver: local
```

### Networks
```yaml
services:
  web:
    networks:
      - frontend
      - backend

  db:
    networks:
      - backend

networks:
  frontend:
    driver: bridge
  backend:
    driver: bridge
```

### Dependencies
```yaml
services:
  web:
    depends_on:
      db:
        condition: service_healthy
      redis:
        condition: service_started
```

### Healthchecks
```yaml
services:
  web:
    healthcheck:
      test: ["CMD", "curl", "-f", "http://localhost:3000/health"]
      interval: 30s
      timeout: 10s
      retries: 3
      start_period: 40s
```

## Example Configurations

### Web Application Stack
```yaml
version: '3.8'

services:
  nginx:
    image: nginx:alpine
    ports:
      - "80:80"
    volumes:
      - ./nginx.conf:/etc/nginx/nginx.conf:ro
    depends_on:
      - web

  web:
    build: .
    expose:
      - "3000"
    environment:
      - NODE_ENV=production
      - DB_HOST=db
    depends_on:
      - db
      - redis

  db:
    image: postgres:13
    volumes:
      - postgres_data:/var/lib/postgresql/data
    environment:
      - POSTGRES_USER=${DB_USER}
      - POSTGRES_PASSWORD=${DB_PASSWORD}

  redis:
    image: redis:6-alpine
    volumes:
      - redis_data:/data

volumes:
  postgres_data:
  redis_data:
```

### Development Environment
```yaml
version: '3.8'

services:
  web:
    build:
      context: .
      target: development
    volumes:
      - .:/app
      - /app/node_modules
    command: npm run dev
    ports:
      - "3000:3000"
    environment:
      - NODE_ENV=development
```

## Common Commands

```bash
# Start services
docker-compose up

# Start in detached mode
docker-compose up -d

# Build/rebuild services
docker-compose build

# Stop services
docker-compose down

# Stop and remove volumes
docker-compose down -v

# View logs
docker-compose logs -f

# Execute command in container
docker-compose exec web npm run test

# List containers
docker-compose ps

# Show resource usage
docker-compose top
```

## Best Practices

1. **Version Control**
- Use specific versions for images
- Pin dependencies in Dockerfile
- Use environment variables for configuration

2. **Security**
- Don't commit sensitive data
- Use environment files
- Set appropriate file permissions

3. **Development vs Production**
- Use different compose files
- Override with docker-compose.override.yml
- Use build targets for different environments

4. **Resource Management**
- Set memory and CPU limits
- Use health checks
- Configure logging appropriately

5. **Networking**
- Use internal networks when possible
- Limit exposed ports
- Use network aliases

6. **Volumes**
- Use named volumes for persistence
- Use bind mounts for development
- Clean up unused volumes 