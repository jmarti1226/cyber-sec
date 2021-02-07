#!/bin/bash

echo "A Quick System Audit Script"
date
echo "Machine Type Info:" echo $MACHTYPE
echo -e "Uname info: $(uname -a) \n"
echo -e "IP Info: $(ip addr | head-9 | tail -1)\n"
echo "Hostname: $(hostname -s)"
echo -e "DNS Servers:" cat /etc/resolv.conf
echo "Memory Info:" free
#Display CPU Usage
echo -e "\nCPU Info:" lscpu | grep CPU
#Display Disk Usage
echo -e "\nDisk Usage:" df -H | head -2
echo -e "\nWho is logged in: \n $(who -a)\n"
echo -e "\nSUID Files:" 
find / -type f -perm /4000
echo -e "\nTop 10 Processes" 
ps aux -m | awk {'print $1, $2, $3, $4, $11'} | head
