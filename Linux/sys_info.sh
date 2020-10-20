#!/bin/bash

echo "Title Goes Here"
date
echo "Machine Type Info:" echo $MACHTYPE
echo -e "Uname info: $(uname -a) \n"
echo -e "IP Info: $(ip addr | head-9 | tail -1)\n"
echo -e "DNS Servers:" cat /etc/resolv.conf
echo "Memory Info:" free
echo -e "\nCPU Info:" lscpu | grep CPU
echo -e "\nDisk Usage:" df -H | head -2
echo -e "\nWho is logged in: \n $(who -a)\n"

mkdir ~/research4 2> /dev/null
echo -e "\nSUID Files:" >> ~/research4/sys_info.txt
find / -type f -perm /4000 >> ~/research4/sys_info.txt
echo -e "\nTop 10 Processes" >> ~/research4/sys_info.txt
ps aux -m | awk {'print $1, $2, $3, $4, $11'} | head >> ~/research/sys_info.txt
 
