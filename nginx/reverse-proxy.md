# Nginx Reverse Proxy Configuration

A reverse proxy is a server that sits between client devices and a web server, forwarding client requests to the appropriate backend servers.

## Basic Reverse Proxy Configuration
```nginx
server {
    listen 80;
    server_name example.com;

    location / {
        proxy_pass http://backend-server:8080;
        proxy_set_header Host $host;
        proxy_set_header X-Real-IP $remote_addr;
        proxy_set_header X-Forwarded-For $proxy_add_x_forwarded_for;
        proxy_set_header X-Forwarded-Proto $scheme;
    }
}
```

## Load Balancing Configuration
```nginx
# Define upstream servers
upstream backend {
    server backend1.example.com:8080;
    server backend2.example.com:8080;
    server backend3.example.com:8080;
}

server {
    listen 80;
    server_name example.com;

    location / {
        proxy_pass http://backend;
        proxy_set_header Host $host;
        proxy_set_header X-Real-IP $remote_addr;
    }
}
```

## Common Proxy Headers
- `Host`: Original host requested by the client
- `X-Real-IP`: Client's IP address
- `X-Forwarded-For`: Client's IP address chain
- `X-Forwarded-Proto`: Original protocol (HTTP/HTTPS)

## WebSocket Support
```nginx
location /websocket {
    proxy_pass http://websocket-backend;
    proxy_http_version 1.1;
    proxy_set_header Upgrade $http_upgrade;
    proxy_set_header Connection "upgrade";
}
```

## SSL Termination
```nginx
server {
    listen 443 ssl;
    server_name example.com;

    ssl_certificate /etc/nginx/ssl/example.com.crt;
    ssl_certificate_key /etc/nginx/ssl/example.com.key;

    location / {
        proxy_pass http://backend;
        proxy_set_header Host $host;
        proxy_set_header X-Real-IP $remote_addr;
    }
}
```

## Caching Configuration
```nginx
# Define cache path
proxy_cache_path /var/cache/nginx levels=1:2 keys_zone=my_cache:10m max_size=10g inactive=60m;

server {
    location / {
        proxy_cache my_cache;
        proxy_cache_use_stale error timeout http_500 http_502 http_503 http_504;
        proxy_cache_valid 200 60m;
        proxy_pass http://backend;
    }
}
```

## Health Checks
```nginx
upstream backend {
    server backend1.example.com:8080 max_fails=3 fail_timeout=30s;
    server backend2.example.com:8080 max_fails=3 fail_timeout=30s;
    check interval=3000 rise=2 fall=5 timeout=1000 type=http;
    check_http_send "HEAD / HTTP/1.0\r\n\r\n";
    check_http_expect_alive http_2xx http_3xx;
}
```

## Rate Limiting
```nginx
# Define limit zone
limit_req_zone $binary_remote_addr zone=one:10m rate=1r/s;

location / {
    limit_req zone=one burst=5;
    proxy_pass http://backend;
}
``` 