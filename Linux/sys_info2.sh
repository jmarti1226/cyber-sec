#!/bin/bash

output=$HOME/research4/sys_info.txt
ip=$(ip addr | head -9 | tail -1)
suids=$(sudo find / -type f -perm /4000 2> /dev/null)
files=('/etc/passwd' '/etc/shadow' '/etc/hosts')

#checks if the text file exists
if [ -f $output ]
then
rm $output
fi

#checks if the directory exists
if [ ! -d $HOME/research4 ]
then
mkdir $HOME/research4
fi

echo "A Quick System Audit Script" >> $output
date >> $output
echo "Machine Type Info:" echo $MACHTYPE >> $output
echo -e "Uname info: $(uname -a) \n" >> $output
echo -e "IP Info: $ip \n" >> $output
echo -e "Hostname: $(hostname -s)" >> $output
echo -e "DNS Servers:" cat /etc/resolv.conf >> $output
echo "Memory Info:" free >> $output
#Display CPU usage
echo -e "\nCPU Info:" lscpu | grep CPU >> $output
#Dispay Disk Usage
echo -e "\nDisk Usage:" df -H | head -2 >> $output
echo -e "\nWho is logged in: \n $(who -a)\n" >> $output


echo -e "\nSUID Files:" >> $output
$suids >> $output
echo -e "\nTop 10 Processes" >> $output
ps aux -m | awk {'print $1, $2, $3, $4, $11'} | head >> $output

for i in ${files[@]};
do
ls -l $i >> $output
done
