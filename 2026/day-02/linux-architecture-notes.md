# Core components of Linux
* Kernel
  * The linux kernel is the core, central program of the operating system that acts as the main bridge between ytour computer's hardware (CPU, memory, disks) and software applications. It manages system resources, handles input/output requests and ensures programs run smoothly wihtout crashing the system.

* User Space
  * User space (or userland) in Linux is the isolated restricted area of memory where all normal user applications such as web browsers, file managers, and games run. Userspace has limited  access to system resources to ensure security and stability.
 
* init / systemd
  * In the world of Linux, "init" stands for initialization. It's the first process launched during the boot process, orchestrating everything from mounting file systems to starting critical services. Think of it as the conductor of the boot symphony, ensuring everything comes online in the right order.

----

## How processes are created and managed
In Linux, a process is a running program identified by a unique number called a Process ID (PID). Processes are created using the `fork()` system call, which splits an existing process into a parent and a new child, followed by `exec()` to start the new program. They are managed by the kernel, which schedules them, monitors their state (running, sleeping or zombie) and allows users to control them using commands like top or kill.

---

## What systemd does and why it matters?
Systemd is a system and service manager that acts as the primary initializer (PID 1) in modern Linux distributions, booting the system and managing userspace processes. It improves on older systems by parallelizing service startup, significantly reducing boot times and handling complex dependencies automatically. It is crucial for managing daemons, mounting file system and logging via `journalctl`. Additionally, it uses control groups _(cgroups)_ to monitor resources and track processes, ensuring system stability and easier troubleshooting. Finally, it provides a standardized toolset `systemctl` for managing services across different Linux platforms.

---

## Explain process states (running, sleeping, zombie and stopped)
Process states ina operating systems represent the current activity of a program. Key states include:
* _Running (R)_ - The process is either currently utilizing the CPU (actively executing) or is in the ready queue, waiting for the scheduler to allocate CPU time.
* _Sleeping (S)_ - The process is inactive, waiting for a specific event to occur (e.g., I/O completion, timer expiration or a signal)
  * Interruptible Sleep (S) - Can be woken by signals
  * Uninterrruptible Sleep (D) - Waiting for hardware, cannot be interrupted or killed until the operation finishes
* _Zombie (Z)_ - The process has finished execution and released its resources, but its entry remains in the system process table. This occurs because the parent  process has not yet read the child's exit status.
* _Stopped (T)_ - This process has been paused, usually by a user (e.g., Ctrl+Z) or a debugger

---

## List of 5 commands that are used daily
* `cd` - Changes the current directory
* `ls` - Lists the files & directories in the current working directory
* `touch / mkdir` - To create new files & directories
* `pwd` - Stands for "print working directory" and outputs the full path of your current location in the file system. 
* `cat` - Short for "concatenate," this command is most often used to display the contents of a text file directly in the terminal.
