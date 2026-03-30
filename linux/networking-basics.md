# Linux Networking Basics

Essential networking commands and concepts for DevOps in production environments.

## Interface and IP
- `ifconfig` / `ip a` — Show interfaces and IPs
- `ip link set eth0 up/down` — Enable/disable interface

## Connectivity
- `ping host` — Test network reachability
- `traceroute host` — Trace route to host
- `nslookup domain` — DNS lookup
- `dig domain` — Detailed DNS info

## Ports and Sockets
- `netstat -tulnp` — List open ports
- `ss -tulwn` — Socket statistics

## Routing
- `route -n` — Show routing table
- `ip route` — Show/manage routes

## Firewall
- `ufw status` — UFW firewall status
- `iptables -L` — List iptables rules

## File Transfers
- `scp user@host:/path .` — Secure copy
- `rsync -avz src/ dest/` — Sync files

## Logs
- `/var/log/syslog` — System logs
- `/var/log/messages` — General messages 