# Essential DevOps Bash Commands for Production

This document lists common bash commands useful for DevOps tasks in production environments.

## System Monitoring
- `top` / `htop` — Monitor system processes
- `free -m` — Check memory usage
- `df -h` — Disk space usage
- `du -sh *` — Directory size summary
- `uptime` — System uptime
- `ps aux` — List running processes
- `vmstat 1` — System performance

## File Management
- `ls -l` — List files with details
- `cp source dest` — Copy files/directories
- `mv source dest` — Move/rename files/directories
- `rm -rf target` — Remove files/directories
- `find /path -name 'pattern'` — Search for files
- `cat file` — View file contents
- `tail -f logfile` — Follow log output
- `head file` — View start of file

## Networking
- `ifconfig` / `ip a` — Show network interfaces
- `ping host` — Test connectivity
- `netstat -tulnp` — List open ports
- `ss -tulwn` — Socket statistics
- `curl url` — HTTP requests
- `wget url` — Download files
- `scp user@host:/path .` — Secure copy
- `ssh user@host` — SSH login

## Package Management
- `apt update && apt upgrade` — Update packages (Debian/Ubuntu)
- `yum update` — Update packages (RHEL/CentOS)
- `dpkg -l` / `rpm -qa` — List installed packages

## User Management
- `whoami` — Current user
- `id` — User and group info
- `sudo command` — Run as superuser
- `adduser username` — Add user
- `passwd username` — Change password

## System Services
- `systemctl status service` — Service status
- `systemctl restart service` — Restart service
- `journalctl -u service` — Service logs

## Miscellaneous
- `crontab -l` — List cron jobs
- `history` — Command history
- `chmod` / `chown` — Permissions/ownership 