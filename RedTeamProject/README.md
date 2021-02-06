# Project Overview

In this project I had to follow the given scenario:

You are working as a Security Engineer for X-CORP, supporting the SOC infrastructure. The SOC analysts have noticed some discrepancies with alerting in the Kibana system and the manager has asked the Security Engineering team to investigate.
To start, flags have been hidden in various locations, you team will need to attack the system and find these flags. A general guide was given as to the location of the flags.
You will then report back all your findings to both the SOC manager and the Engineering Manager with appropriate analysis.

I started by attacking the Target machine:

1. Scan the network to identify the IP addresses of Target 1.

![Screenshot](https://github.com/jmarti1226/cyber-sec/blob/main/RedTeamProject/Images/initial_nmap_results.png)
![Screenshot](https://github.com/jmarti1226/cyber-sec/blob/main/RedTeamProject/Images/initial_nmap_results2.png)

2. Document all exposed ports and services.

![Screenshot](https://github.com/jmarti1226/cyber-sec/blob/main/RedTeamProject/Images/vuln_scan.png)
![Screenshot](https://github.com/jmarti1226/cyber-sec/blob/main/RedTeamProject/Images/vuln_scan2.png)
![Screenshot](https://github.com/jmarti1226/cyber-sec/blob/main/RedTeamProject/Images/vuln_scan3.png)

3. Enumerate the WordPress site. One flag is discoverable after this step.

![Screenshot](https://github.com/jmarti1226/cyber-sec/blob/main/RedTeamProject/Images/wordpress_scan.png)
![Screenshot](https://github.com/jmarti1226/cyber-sec/blob/main/RedTeamProject/Images/wordpress_scan2.png)

    The guide says a flag is discoverable by enumerating the site but the tool I used (wpscan) did not show me any flag. After further research and searching I happened upon the flag in the source code for the services webpage. I am not sure if the guide was incorrect or if my efforts were misguided, regardless here is the flag: 

    Flag1 can be found in the page source for 192.168.1.110/services:

![Screenshot](https://github.com/jmarti1226/cyber-sec/blob/main/RedTeamProject/Images/flag1_pagesource.png)

4. Use SSH to gain a user shell. Two flags can be discovered at this step.

![Screenshot](https://github.com/jmarti1226/cyber-sec/blob/main/RedTeamProject/Images/hydra_michael.png)
![Screenshot](https://github.com/jmarti1226/cyber-sec/blob/main/RedTeamProject/Images/ssh_michael.png)

    Flag1, it turns out, can also be found after logging in as Michael and running grep for a flag:

![Screenshot](https://github.com/jmarti1226/cyber-sec/blob/main/RedTeamProject/Images/flag1_grep.png)

    Flag2 can be found the same was as the first flag using grep:

![Screenshot](https://github.com/jmarti1226/cyber-sec/blob/main/RedTeamProject/Images/flag2.png)


5. Find the MySQL database password.

    Found in wp-config.php file in /var/www/html/wordpress

![Screenshot](https://github.com/jmarti1226/cyber-sec/blob/main/RedTeamProject/Images/MySQL_login.png)

6. Use the credentials to log into MySQL and dump WordPress user password hashes.

![Screenshot](https://github.com/jmarti1226/cyber-sec/blob/main/RedTeamProject/Images/logged_into_mysql.png)
![Screenshot](https://github.com/jmarti1226/cyber-sec/blob/main/RedTeamProject/Images/wp_hashes.png)

    A third flag, Flag3, can be found in the MySQL database: wp_post (Flag 4 is also shown but I doubt that this was intentional):

![Screenshot](https://github.com/jmarti1226/cyber-sec/blob/main/RedTeamProject/Images/flag3.png)

7. Crack password hashes with john.

    I copied the hashes into a text file and had John crack the hashes:

![Screenshot](https://github.com/jmarti1226/cyber-sec/blob/main/RedTeamProject/Images/john_output.png)

8. Secure a user shell as the user whose password you cracked.

![Screenshot](https://github.com/jmarti1226/cyber-sec/blob/main/RedTeamProject/Images/steven_elevated.png)

9. Escalate to root. One flag can be discovered after this step.

    After logging in as Steven I checked the user's sudo privileges:

![Screenshot](https://github.com/jmarti1226/cyber-sec/blob/main/RedTeamProject/Images/sudo_priv.png)

    I then used the following command to gain root access:

![Screenshot](https://github.com/jmarti1226/cyber-sec/blob/main/RedTeamProject/Images/python_root.png)

    Flag4 was found using the locate command for flag4:

![Screenshot](https://github.com/jmarti1226/cyber-sec/blob/main/RedTeamProject/Images/flag4.png)