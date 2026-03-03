# Linux File System Hierarchy (Most Important Directories)
## Let's practice troubleshooting and learn where things reside in Linux.
## Core Directories (Must know):
* `/ (root)` - In Linux, the forward slash `(/)` represents the root directory, it is the topmost level of the entire file system hierarchy. It is the starting point of everything
  *  I would use this to get into the root of Linux system
* `/home` - Home directory is a personal directory assigned to a user. It's where you'll find your personal files, configurations and data. Permissions are not needed for users to utilize their own home directory
  * I would use this to list home directories of all users
* `/root` - This is the dedicated home directory for the special administrative user "root" (the super user). It is generally only accessible by the root user to store their personal files, configurations, and administrative data
  * I would use this to store files that only root user can access
* `/etc` - The `/etc` directory in Linux is the central location for system-wide configuration files. These files are generally static, text-based, and crucial for controlling the behavior of the operating system and its installed applications
* `/etc/passwd` - This file stores essential user account information, with one entry per line
  * I would use this to check any users account information 
* `/etc/fstab` - This file is a crucial Linux configuration file containing static information about filesystems, disk partitions, and other data sources
  * I would use this to check a server disk if it isn't mounting after reboot 
* `/etc/shadow` - The `/etc/shadow` file in Linux is a secured, root-only accessible file that stores user account information, most imporatantly the hashed (encrypted) passwords and password aging policy details
  * I would use this file to check the encrypted user passwords 
* `/var/log` - It is the standard directory where system logs are stored. It stores log files created by the operating system, applications and services. These logs are essential for troubleshooting issues, monitoring system activity, and auditing events
* `/var/log/syslog` - This is a general system log file
  * I would use this to view general system and service related logs
* `/var/log/auth.log` - This file contains authentication and security related logs on Linux systems
  * I would use this to check logs related to authentication
* `/tmp` - It is a short-term storage location used by the system and applications to store temporary working files that are not meant to be permanent
  * I would use this to store any files that I won't require after reboot
---
## Additional Directories (Good to know):
* `/bin` - It is a core Linux directory that contains essential user command binaries. `/bin` stores important command-line tools that are required for the system to function properly, even if other filesystems are not mounted
* `/usr/bin` - It stores most user-level command binaries and applications. `/usr/bin` contains non-essential user commands and applications, whereas `/bin` contains essential commands needed for basic system opertaion
  * I would use this file to check for commands 
* `/opt` - `/opt` is used for optional or third-party software packages that are not part of the default operating system. It is where manually installed or external software is kept, separate from system files
  * I would use this directory to see what external or commercial applications are installed
---
# Scenario Based Practice
## Scenario 1: Service not starting
```
A web application service called 'nginx' failed to start after a server reboot.
What commands would you run to diagnose the issue?
Write atleast 4 commands in order
```
Step 1: `systemctl status nginx`

Why: Check if the service is running or failed or stopped

Step 2: `journalctl -u nginx -n 50`

Why: If service is failed check logs

Step 3: `systemctl is-enabled nginx`

Why: To check if the service starts automatically on boot

---
## Scenario 2: High CPU Usage
```
Your manager reports that the application server is slow.
You ssh into the server. What commands would you run to identify which process is using high CPU?
```
Step 1: `top/htop`

Why: Lists all the running processes. Check for processes that are CPU intensive

Step 2: `ps -aux --sort=-%cpu | head -10`

Why: Sort the processes by CPU percentage. Note down PID of top processes

Step 3: `sudo renice +10 -p PID`

Why: Increases the nice value, lowering the process priority so it gets less CPU time. Useful if you don't want to kill the process but need to reduce its impact

Step 4: `kill PID`

Why: Kill CPU intensive process if necessary

---
## Scenario 3: Find Service logs
```
A developer asks: "Where are the logs for the 'docker' service?"
The service is managed by systemd.
What commands would you use?
```
Step 1: `systemctl status docker`

Why: Check the service status to see if it's stopped or failing

Step 2: `journalctl -u docker -n 50`

Why: Check last 50 lines of logs

Step 3: `journalctl -u docker -f`

Why: Check the real-time logs

---
## Scenario 4: File permissions issue
```
A script at /home/user/backup.sh is not executing
When you run it: ./backup.sh
You get: "Permission denied"
```
Step 1: `ls -l backup.sh`

Why: Check current permissions of file. Look for: -rw-r--r-- (notice no 'x' = not executable)

Step 2: `chmod +x backup.sh`

Why: Adds execute permission to file

Step 3: `ls -l backup.sh`

Why: Verify it worked. Look for: -rwxr-xr-x (notice 'x' = executable)

Step 4: ./backup.sh

Why: Executes the script
