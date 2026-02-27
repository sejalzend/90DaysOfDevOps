# Commands I practiced and their real-time outputs

## Process Commands
* `ps a` - Displays a snapshot of all current running processes on the system
![snapshot](images/ps.png)

---
* `ps -aux | head -n 10` - It lists all the running processes on the system with the top 10 lines
![snapshot](images/ps_aux.png)

---

* `pgrep -n bash` - It selects only the newest (most recently started) of the matching processes
![snapshot](images/pgrep.png)

---

## Service Commands

* `systemctl status nginx` - Shows the status of the service (Active or Inactive) 
![snapshot](images/systemctl-status-nginx)

---
* `systemctl list-units --type=service --state=inactive` - Lists all the inactive service units that uses systemd 
![snapshot](images/systemctl_list-units_5.png)

---

## Log Commands
* `journalctl -u docker | head -n 10` - Shows the logs of the docker service and only displays the first 10 lines
![snapshot](images/journalctl_docker.png)

---
* `tail -n 20 /var/log/syslog` - Displays the last 20 lines of the log file `/var/log/syslog`
![snapshot](images/tail_log.png)

---
## Inspection of *Nginx* service 
* `systemctl status nginx` - Shows the current status of the *Nginx* service - whether it is running, stopped or failed - along with recent logs and process details
![snapshot](images/systemctl_status_nginx.png)

---
* `journalctl -u nginx | head -n 5` - Displays the first 5 log entries of the nginx service from the system journal, helping you quickly check its initial log messages
![snapshot](images/journalctl_nginx.png)

---
* `sudo systemctl start nginx` - Starts the nginx service with administrative privileges
  * Since the service was stopped, this command restarts it and brings it back to a running state
![snapshot](images/systemctl_start.png)

---

* `systemctl status nginx` - Shows the status of *Nginx* service. It is successfully up and running
![snapshot](images/systemctl_status_nginx_active.png)

