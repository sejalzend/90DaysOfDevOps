# Runbook for Docker/ssh service
## Documented step-by-guide to check, troubleshoot, and manage the Docker/ssh service on a system.

## Environment Basic
* Command: `uname -a`
  
  Output:  `Linux ip-172-31-18-210 6.17.0-1007-aws #7~24.04.1-Ubuntu SMP Thu Jan 22 21:04:49 UTC 2026 x86_64 x86_64 x86_64 GNU/Linux`

  Observation: Displays complete system information in one line. It shows the kernel name, hostname, kernel version, build details, machine architecture (like x86_64) and operating system
* Command: `lsb_release -a`
  
  Output:   `No LSB modules are available.`
            `Distributor ID: Ubuntu`
            `Description: Ubuntu 24.04.3 LTS`
            `Release: 24.04`
            `Codename: noble`

  Observation: It displays the distributor ID, description, release version and codename (for e.g: Ubuntu Jammy 22.04 Jammy) It is useful when you need to confirm the exact OS version installed
--- 
## Filesystem Sanity
* Command: `mkdir /tmp/runbook-demo`

  Observation: Creates a temporary test directory named runbook-demo inside the tmp directory
  
* Command: `cp /etc/hosts /tmp/runbook-demo/hosts-copy && ls -l /tmp/runbook-demo`
  
  Observation: The command first copies the `/etc/hosts` file into `/tmp/runbook-demo` and renames it as `hosts-copy`. The `&&` ensures the second command runs only if the copy is successful
---
## CPU/Memory
* Command: `free -h`

  Output:

    | Type | Total | Used | Free | Shared | Buff/Cache | Available |
    |------|-------|------|------|--------|------------|------------|
    | Mem  | 911Mi | 416Mi | 98Mi | 2.7Mi | 557Mi | 494Mi |
    | Swap | 0B | 0B | 0B | - | - | - |

  Observation: Shows total, used, and available RAM in human-readable format. Sufficient memory is available
* Command: `ps -o pid,pcpu,pmem,comm -p $(pidof dockerd)`

  Output: `PID 4161`
          `%CPU 0.0`
          `%MEM  7.5`
          `COMMAND dockerd`

  Observation: Process is running with PID 4161. Currently using 0.0% CPU, which means there is no active load at the moment, and 7.5% of memory, indicating moderate RAM usage by the Docker daemon
---
## Disk/IO
* Command: `df -h`

  Output:
    | Filesystem        | Size | Used | Avail | Use% | Mounted on            |
    |-------------------|------|------|-------|------|-----------------------|
    | /dev/root         | 19G  | 2.7G | 16G   | 15%  | /                     |
    | tmpfs             | 456M | 0    | 456M  | 0%   | /dev/shm              |
    | tmpfs             | 183M | 928K | 182M  | 1%   | /run                  |
    | tmpfs             | 5.0M | 0    | 5.0M  | 0%   | /run/lock             |
    | efivarfs          | 128K | 3.8K | 120K  | 4%   | /sys/firmware/efi/efivars |
    | /dev/nvme0n1p16   | 881M | 156M | 663M  | 20%  | /boot                 |
    | /dev/nvme0n1p15   | 105M | 6.2M | 99M   | 6%   | /boot/efi             |
    | tmpfs             | 92M  | 12K  | 92M   | 1%   | /run/user/1000        |

  Observation: The root file system `/dev/root` is 19G total, with only 15% used (2.7G) and 16G available, indicating plenty of free space. All other partitions, including `/boot` and `/boot/efi`, are also well below critical usage levels (maximum 20%)
* Command: `vmstat`

  Output:
  | r | b | swpd | free  | buff  | cache  | si | so | bi | bo | in | cs | us | sy | id | wa | st | gu |
  |---|---|------|-------|-------|--------|----|----|----|----|----|----|----|----|----|----|----|----|
  | 2 | 0 | 0    | 77952 | 11088 | 559560 | 0  | 0  | 55 | 35 | 77 | 0  | 0  | 0  | 100| 0  | 0  | 0  |

  Observation: CPU is 100% idle (`id = 100`), meaning the system is not under load. No swap usage (`swpd=0`,`si=0`,`so=0`), which indicates healthy memory availability. 2 processes are running (`r = 2`) but none are blocked (`b = 0`)
---
## Network 
* Command: `sudo ss -tulpn | grep sshd`

  Output: `tcp   LISTEN 0   4096   0.0.0.0:22   0.0.0.0:*   users:(("sshd",pid=1251,fd=3),("systemd",pid=1,fd=90))`

  Observation: ssh is listening on port 22
* Command: `nc -zv localhost 22`

  Output: `Connection to localhost (127.0.0.1) 22 port [tcp/ssh] succeeded!`

  Observation: Connection is confirmed
---
## Logs
* Command: `journalctl -u ssh -n 20`

  Observation: Last 20 lines shows normal authentication attempts and no error or warnings
* Command: `tail -n 50 /var/log/auth.log`

  Observation: Recent login attempts record. No suspicious activity detected
---
# Quick Review
1. ssh/docker service running normally with low CPU usage
2. Disk and log size is healthy
3. Network port 22 is open and serving connections
4. No error in logs
---
# If this worsens
1. Check logs again
2. Check CPU usage and Disk usage
3. Restart service
4. Check if port is used by other service
