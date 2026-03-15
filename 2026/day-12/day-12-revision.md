# Breather & Revision (Days 01-11)
* ## Mindset & Plan

  The goal of completing this course and its tasks is to develop the practical skills needed to transition into a DevOps or Cloud role. Through consistent hands-on practice and continuous learning, I am steadily working toward becoming a Cloud/DevOps Engineer focusing on progress one day at a time and valuing consistency over perfection.
* ## Processes & Services
  To assess the overall health of the system, I will execute the following commands to verify that all services, processes, and system resources are running smoothly.
    
  * `ps aux` - It lists all the running processes on the system
  * `systemctl status <servicename>` - It shows the status of any service that is mentioned (active, stopped)
  * `journalctl -u <servicename>` - This command displays logs of a specific mentioned service. It is used to troubleshot issues
  * `htop` - Shows all the prcoess in an interactive process view
* ## File Skills

  Practiced creating and modifying Linux files and directories while managing access permissions. Below are the commands used to safely change ownership and permissions.

  * `chmod +x filename` - Makes the file executable
  * `sudo chown uname:uname filename` - Changes the owner and group of the file
  * `ls -l filename` - Shows a long list of permissions of the file

 * ## Cheat Sheet Refresh

   Commands that I would come back to for troubleshooting

    * `ps aux | grep pid` - To filter out any specific process ID
    * `curl -I localhost` - To check if the service is actually responding to requests
    * `systemctl status <servicename>` - To check for a service if it's not working
    * `journalctl -u <servicename>` - Checking for the logs of a service to troubleshoot issues

* ## What will I focus on improving in the next 3 days?

  * Focus on Networking & Linux Volume Management
  * Practice more about User & Group management
  * Start with Python 
  
