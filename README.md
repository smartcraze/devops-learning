# DevOps Playground Documentation

A comprehensive collection of DevOps tools, configurations, and best practices documentation.

## Table of Contents

### 🐋 Docker
- [Dockerfile Guide](docker/dockerfile-guide.md)
  - Basic Dockerfile Structure
  - Multi-Stage Builds
  - Best Practices
  - Common Commands
  - Layer Optimization
  - Security Best Practices
  - Example Dockerfiles (Web, Python, Java)

- [Docker Compose Guide](docker/compose-guide.md)
  - Basic Compose Structure
  - Common Configurations
  - Environment Variables
  - Volumes & Networks
  - Development vs Production
  - Example Configurations

- [Docker Commands](docker/commands-guide.md)
  - Container Management
  - Image Management
  - Network Management
  - Volume Management
  - System Commands
  - Best Practices

### ☸️ Kubernetes
- [Local Development Setup](k8s/local-development-setup.md)
  - Installation Guide (kubectl, kind, minikube)
  - Local Cluster Setup
  - Basic & Advanced Commands
  - Development Workflows
  - Troubleshooting
  - Tips and Tricks

- [Kubernetes Services](k8s/kubernetes-services.md)
  - ClusterIP Services
  - NodePort Services
  - LoadBalancer Services
  - ExternalName Services
  - Headless Services
  - Service Configuration
  - Troubleshooting

- [Pods and Deployments](k8s/pods-and-deployments.md)
  - Pod Specifications
  - Deployment Strategies
  - ReplicaSets
  - Configuration
  - Best Practices
  - Common Issues

- [Storage and Persistence](k8s/storage-and-persistence.md)
  - Volume Types
  - Persistent Volumes
  - Persistent Volume Claims
  - Storage Classes
  - Backup & Restore
  - Cloud Provider Integration

### 🌐 Nginx
- [Basic Configuration](nginx/basic-config.md)
  - Server Blocks
  - Location Blocks
  - SSL Configuration
  - Performance Settings
  - Security Headers
  - Logging

- [Reverse Proxy](nginx/reverse-proxy.md)
  - Basic Setup
  - Load Balancing
  - SSL Termination
  - Caching
  - WebSocket Support
  - Headers and Proxy Settings

### 🔄 CI/CD
- [GitHub Actions](ci-cd/github-actions.md)
  - Workflow Syntax
  - Events & Triggers
  - Jobs & Steps
  - Environment Variables
  - Secrets Management
  - Example Workflows

- [Jenkins](ci-cd/jenkins.md)
  - Pipeline Syntax
  - Jenkinsfile Examples
  - Plugins & Tools
  - Best Practices
  - Security Configuration
  - Integration Guide

- [CI/CD Workflows](ci-cd/workflows.md)
  - Development Pipeline
  - Testing Strategy
  - Deployment Stages
  - Release Management
  - Monitoring & Alerts

### 🐧 Linux
- [Bash Commands](linux/bash-commands.md)
  - System Monitoring
  - File Management
  - Network Commands
  - Package Management
  - User Management
  - System Services

- [File Permissions](linux/file-permissions.md)
  - Permission Types
  - Ownership
  - Special Permissions
  - Access Control
  - Security Best Practices

- [Networking Basics](linux/networking-basics.md)
  - Interface Configuration
  - Routing
  - Firewall Rules
  - DNS Setup
  - Troubleshooting

### 📁 Git
- [Git CLI Guide](git/git-cli.md)
  - Basic Commands
  - Branching Strategy
  - Merge vs Rebase
  - Advanced Operations
  - Best Practices

## How to Use This Repository

1. **Finding Information**
   - Use the table of contents above to navigate to specific topics
   - Each section contains detailed documentation with examples
   - Look for the "Best Practices" section in each guide

2. **Local Development**
   - Start with the [Local Development Setup](k8s/local-development-setup.md) guide
   - Follow tool-specific installation guides
   - Use provided example configurations

3. **Production Deployment**
   - Reference the best practices sections
   - Follow security guidelines
   - Use production-ready configurations

4. **Troubleshooting**
   - Each guide includes a troubleshooting section
   - Common issues and solutions are documented
   - Debug commands and procedures are provided

## Contributing

Feel free to contribute to this documentation by:
1. Submitting issues for corrections or clarifications
2. Creating pull requests with improvements
3. Suggesting new topics or examples

## License

This documentation is available under the MIT License. See the LICENSE file for more details.


add resources

