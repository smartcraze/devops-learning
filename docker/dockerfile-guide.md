# Dockerfile Guide and Best Practices

This guide covers Dockerfile creation, optimization, and best practices for building efficient container images.

## Basic Dockerfile Structure

```dockerfile
# Start from a base image
FROM ubuntu:22.04

# Set maintainer info
LABEL maintainer="your-email@example.com"

# Set environment variables
ENV APP_HOME=/app \
    NODE_ENV=production

# Set working directory
WORKDIR $APP_HOME

# Install dependencies
RUN apt-get update && apt-get install -y \
    nodejs \
    npm \
    && rm -rf /var/lib/apt/lists/*

# Copy application files
COPY package*.json ./
RUN npm install --production

COPY . .

# Expose ports
EXPOSE 3000

# Set the default command
CMD ["npm", "start"]
```

## Multi-Stage Builds
```dockerfile
# Build stage
FROM node:16 AS builder

WORKDIR /app
COPY package*.json ./
RUN npm install

COPY . .
RUN npm run build

# Production stage
FROM node:16-slim

WORKDIR /app
COPY --from=builder /app/dist ./dist
COPY package*.json ./
RUN npm install --production

EXPOSE 3000
CMD ["npm", "start"]
```

## Best Practices

### 1. Base Image Selection
- Use official images when possible
- Use specific version tags instead of `latest`
- Use slim/alpine variants for smaller images
```dockerfile
FROM node:16-slim
# or
FROM alpine:3.14
```

### 2. Layer Optimization
- Combine related commands
- Order commands from least to most frequently changing
```dockerfile
RUN apt-get update && apt-get install -y \
    package1 \
    package2 \
    && rm -rf /var/lib/apt/lists/*
```

### 3. Cache Utilization
- Copy dependency files first
- Install dependencies before copying application code
```dockerfile
COPY package.json package-lock.json ./
RUN npm install
COPY . .
```

### 4. Security Best Practices
- Use non-root users
- Remove unnecessary dependencies
```dockerfile
# Create and use non-root user
RUN useradd -r -u 1001 appuser
USER appuser

# Remove build dependencies
RUN apt-get purge -y build-essential
```

### 5. Environment Variables
- Use ARG for build-time variables
- Use ENV for runtime variables
```dockerfile
ARG NODE_VERSION=16
FROM node:${NODE_VERSION}

ENV APP_HOME=/app
ENV NODE_ENV=production
```

### 6. Healthchecks
```dockerfile
HEALTHCHECK --interval=30s --timeout=3s \
  CMD curl -f http://localhost:3000/health || exit 1
```

## Common Dockerfile Commands

### COPY vs ADD
```dockerfile
# COPY is preferred for simple file copying
COPY . .

# ADD is used for URLs and tar extraction
ADD https://example.com/file.tar.gz /tmp/
```

### ENTRYPOINT vs CMD
```dockerfile
# ENTRYPOINT sets the main executable
ENTRYPOINT ["nginx"]

# CMD provides default arguments
CMD ["-g", "daemon off;"]
```

### Volume Declaration
```dockerfile
# Declare volumes for persistent data
VOLUME ["/data"]
```

## Example Dockerfiles

### Web Application
```dockerfile
FROM node:16-slim

WORKDIR /app

COPY package*.json ./
RUN npm install --production

COPY . .

EXPOSE 3000
HEALTHCHECK --interval=30s CMD curl -f http://localhost:3000/health
CMD ["npm", "start"]
```

### Python Application
```dockerfile
FROM python:3.9-slim

WORKDIR /app

COPY requirements.txt .
RUN pip install --no-cache-dir -r requirements.txt

COPY . .

CMD ["python", "app.py"]
```

### Java Application
```dockerfile
FROM maven:3.8-openjdk-11 AS builder

WORKDIR /app
COPY pom.xml .
COPY src ./src

RUN mvn package -DskipTests

FROM openjdk:11-jre-slim

COPY --from=builder /app/target/*.jar app.jar
EXPOSE 8080
CMD ["java", "-jar", "app.jar"]
```

## Optimization Tips

1. **Use .dockerignore**
```
node_modules
npm-debug.log
Dockerfile
.dockerignore
.git
.gitignore
```

2. **Minimize Layer Size**
- Remove unnecessary files
- Clean up package manager caches
- Use multi-stage builds

3. **Leverage Build Cache**
- Order instructions from least to most frequently changing
- Separate dependency installation from code copying

4. **Security Considerations**
- Scan images for vulnerabilities
- Use minimal base images
- Keep base images updated
- Run as non-root user 