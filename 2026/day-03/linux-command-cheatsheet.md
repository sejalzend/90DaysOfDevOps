# Cheatsheet of commands focusing on: _Process Management_, _File System_, and _Network Management_
---
## Process Management:

* `top` - Provides a real time dynamic view of running processes and system resource usage (CPU, memory, etc)
* `htop` - An enhanced, user friendly alternative to `top` that allows vertical and horizontal scrolling and easier interactive process management (often requires installation: `sudo apt install htop` or similar command based on distribution)
* `ps` - This is the most basic command to see all running processes on the system. It outputs all running processes of specific user or all users
* `ps aux` - Displays a *snapshot* of all running processes in detail, including their PID, CPU and memory usage
* `pstree` - This command is useful if you want to see running processes hierarchically arranged in tree fornmat 
* `nice` - Nice command is used to assign particular priority, thus giving the process more or less time than other processes
* `kill PID` - Terminates a specific process by sending a signal ( by default, `SIGTERM` for graceful exit) using its Process ID (PID)
* `jobs` - Lists all background jobs that are running or stopped in the current shell session

---

## File System:

* `cp` - Copies a file or directory from a source to destination
  * Example: `cp source_file.txt destination/`
* `mv` - Moves or renames a file or directory
  * Example: `cp source_file.txt destination/` 
* `rm` - Deletes a file or an entire directory (with the `-r` option for directories)
  * Example: `rm file_to_delete.txt ` 
* `rmdir` - Deletes an *empty* directory from the file system
  * Example: `rmdir empty_folder` removes the specified empty directory 
* `less` - Allows viewing the content of a file one page at a time, useful for large files (press *q* to quit)
  * Example: `less large_log_file.txt` opens the file for interactive viewing  
* `head` - Displays the first few lines (default is 10) of a file
  * Example: `head -n 5 file.txt` shows the first 5 lines
* `tail` - Displays the last few lines (default is 10) of a file
  * Example: `tail -f log_file.txt` watches the end of a log file in real-time
* `grep` - Searches for a specified text pattern within files
  * Example: `grep "error" logfile.txt` prints lines containing the word "error"

---

## Network Troubleshooting:

* `ping` - Checks if a remote host is reachable using ICMP packets. `ping trainwithshubham.com`
* `ip addr` - Displays IP addresses and configuration details for all network interfaces. `ip addr`
* `traceroute` - Traces the path packets take to a destination, showimg all intermediate hops and potential points of failure. `traceroute trainwithshubham.com`
* `dig` - Queries DNS name servers to get detailed information about DNS records, useful for troubleshooting name resolution issues. `dig trainwithshubham.com`
* `nslookup` - A simpler utility for DNS lookups to resolve domain names to IP addresses or vice versa. `nslookup trainwithshubham.com`
* `netstat` - Shows active network connections, listening ports, and routing tables (still widely used on all systems) `netstat -t` (lists all the TCP connections)  
* `curl` - Transfers data from or to a server, useful for testing applicaton connectivity over various protocols like HTTP or FTP. `curl -I trainwithshubham.com` (fetches only the header of the website)
* `ss` - Displays detailed information about network sockets, a faster replacement for `netstat` on modern systems. `ss -ta` (lists all TCP connections and listening ports)
