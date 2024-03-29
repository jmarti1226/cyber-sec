# Bash Scripting

Some scripts I made using Linux.

## sys_info.sh

The first sys_info is a script that prints out:

A title and today's date.
The uname info for the machine.
The machine's IP address. (Narrowed this output down to one line.)
The Hostname.
The DNS info.
The Memory info.
The CPU info.
The Disk usage.
The currently logged on users.

- ![sys_info.sh](https://github.com/jmarti1226/cyber-sec/blob/main/Linux/sys_info.sh)

## sys_info2.sh

The second one outputs the same information but now it outputs tbe information to a file. The script first checks if the file and directory exists, if the file exists then it deletes it to then make a new one. If the directory doesn't exist then it makes it.

- ![sys_info2.sh](https://github.com/jmarti1226/cyber-sec/blob/main/Linux/sys_info2.sh)

## system.sh

This script does the following:

Prints the amount of free memory on the system and saves it to ~/backups/freemem/free_mem.txt.

Prints disk usage and saves it to ~/backups/diskuse/disk_usage.txt.

Lists all open files and saves it to ~/backups/openlist/open_list.txt.

Prints file system disk space statistics and saves it to ~/backups/freedisk/free_disk.txt.

- ![system.sh](https://github.com/jmarti1226/cyber-sec/blob/main/Linux/system.sh)
