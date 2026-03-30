# Linux File Permissions

Understanding and managing file permissions is crucial for security and operations in production.

## Permission Types
- **r** — Read
- **w** — Write
- **x** — Execute

## Permission Structure
- `-rwxr-xr--` (example)
  - User: rwx (read, write, execute)
  - Group: r-x (read, execute)
  - Others: r-- (read)

## Changing Permissions
- `chmod 755 file` — Set permissions (rwxr-xr-x)
- `chmod u+x script.sh` — Add execute for user
- `chmod -R 644 dir/` — Recursive change

## Changing Ownership
- `chown user:group file` — Change owner
- `chown -R user:group dir/` — Recursive

## Viewing Permissions
- `ls -l` — List with permissions

## Special Permissions
- `chmod +s file` — Setuid/setgid
- `chmod +t dir` — Sticky bit 