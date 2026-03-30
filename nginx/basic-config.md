# Nginx Basic Configuration Guide

This guide covers the fundamental concepts and configurations for Nginx web server.

## Basic Configuration Structure
The main Nginx configuration file is typically located at `/etc/nginx/nginx.conf`.

```nginx
# Main context
user nginx;
worker_processes auto;
error_log /var/log/nginx/error.log warn;
pid /var/run/nginx.pid;

# Events context
events {
    worker_connections 1024;
}

# HTTP context
http {
    # MIME types
    include /etc/nginx/mime.types;
    default_type application/octet-stream;

    # Logging
    access_log /var/log/nginx/access.log;
    error_log /var/log/nginx/error.log;

    # Basic Settings
    sendfile on;
    tcp_nopush on;
    tcp_nodelay on;
    keepalive_timeout 65;
    types_hash_max_size 2048;

    # Virtual Host Configs
    include /etc/nginx/conf.d/*.conf;
}
```

## Server Block Example
```nginx
server {
    listen 80;
    server_name example.com www.example.com;
    root /var/www/html;

    location / {
        index index.html index.htm;
        try_files $uri $uri/ =404;
    }

    # Error pages
    error_page 404 /404.html;
    error_page 500 502 503 504 /50x.html;
}
```

## Common Directives
- `listen`: Specifies the port
- `server_name`: Domain names
- `root`: Document root directory
- `location`: URL pattern matching
- `index`: Default files
- `try_files`: File lookup order

## Performance Settings
```nginx
# Gzip compression
gzip on;
gzip_types text/plain text/css application/json application/javascript text/xml;
gzip_min_length 1000;

# Client body size
client_max_body_size 100M;

# Buffer size
client_body_buffer_size 128k;
client_header_buffer_size 1k;
```

## Security Headers
```nginx
add_header X-Frame-Options "SAMEORIGIN";
add_header X-XSS-Protection "1; mode=block";
add_header X-Content-Type-Options "nosniff";
add_header Strict-Transport-Security "max-age=31536000";
```

## Testing Configuration
```bash
# Test configuration syntax
nginx -t

# Reload configuration
nginx -s reload
```

## Common Commands
- `nginx -s stop` - Stop server
- `nginx -s reload` - Reload configuration
- `nginx -s reopen` - Reopen log files
- `systemctl status nginx` - Check service status 