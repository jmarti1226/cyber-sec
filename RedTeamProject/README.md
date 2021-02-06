Project Overview

In this project I had to follow the given scenario:

You are working as a Security Engineer for X-CORP, supporting the SOC infrastructure. The SOC analysts have noticed some discrepancies with alerting in the Kibana system and the manager has asked the Security Engineering team to investigate.
To start, flags have been hidden in various locations, you team will need to attack the system and find these flags. A general guide was given as to the location of the flags.
You will then report back all your findings to both the SOC manager and the Engineering Manager with appropriate analysis.

I started by attacking the Target machine:

1. Scan the network to identify the IP addresses of Target 1.

![Diagram](https://github.com/jmarti1226/cyber-sec/blob/main/RedTeamProject/initial_nmap_results)
![Diagram](https://github.com/jmarti1226/cyber-sec/blob/main/RedTeamProject/initial_nmap_results2)

2. Document all exposed ports and services.

![Diagram](https://github.com/jmarti1226/cyber-sec/blob/main/RedTeamProject/vuln_scan)
![Diagram](https://github.com/jmarti1226/cyber-sec/blob/main/RedTeamProject/vuln_scan2)
![Diagram](https://github.com/jmarti1226/cyber-sec/blob/main/RedTeamProject/vuln_scan3)

3. Enumerate the WordPress site. One flag is discoverable after this step.

![Diagram](https://github.com/jmarti1226/cyber-sec/blob/main/RedTeamProject/wordpress_scan)
![Diagram](https://github.com/jmarti1226/cyber-sec/blob/main/RedTeamProject/wordpress_scan2)

The guide says a flag is discoverable by enumerating the site but the tool I used (wpscan) did not show me any flag. After further research and searching I happened upon the flag in the source code for the services webpage. I am not sure if the guide was incorrect or if my efforts were misguided, regardless here is the flag: 

Flag1 can be found in the page source for 192.168.1.110/services:
![Diagram](https://github.com/jmarti1226/cyber-sec/blob/main/RedTeamProject/flag1_pagesource)

4. Use SSH to gain a user shell. Two flags can be discovered at this step.

![Diagram](https://github.com/jmarti1226/cyber-sec/blob/main/RedTeamProject/hydra_michael)
![Diagram](https://github.com/jmarti1226/cyber-sec/blob/main/RedTeamProject/ssh_michael)

Flag1, it turns out, can also be found after logging in as Michael and running grep for a flag:

![Diagram](https://github.com/jmarti1226/cyber-sec/blob/main/RedTeamProject/flag1_grep)

Flag2 can be found the same was as the first flag using grep:

![Diagram](https://github.com/jmarti1226/cyber-sec/blob/main/RedTeamProject/flag2)


5. Find the MySQL database password.

Found in wp-config.php file in /var/www/html/wordpress
![Diagram](https://github.com/jmarti1226/cyber-sec/blob/main/RedTeamProject/MySQL_login)

6. Use the credentials to log into MySQL and dump WordPress user password hashes.

![Diagram](https://github.com/jmarti1226/cyber-sec/blob/main/RedTeamProject/logged_into_mysql)
![Diagram](https://github.com/jmarti1226/cyber-sec/blob/main/RedTeamProject/wp_hashes)

A third flag, Flag3, can be found in the MySQL database: wp_post (Flag 4 is also shown but I doubt that this was intentional):

![Diagram](https://github.com/jmarti1226/cyber-sec/blob/main/RedTeamProject/flag3)

7. Crack password hashes with john.

I copied the hashes into a text file and had John crack the hashes:
![Diagram](https://github.com/jmarti1226/cyber-sec/blob/main/RedTeamProject/john_output)

8. Secure a user shell as the user whose password you cracked.

![Diagram](https://github.com/jmarti1226/cyber-sec/blob/main/RedTeamProject/steven_elevated)

9. Escalate to root. One flag can be discovered after this step.

After logging in as Steven I checked the user's sudo privileges:
![Diagram](https://github.com/jmarti1226/cyber-sec/blob/main/RedTeamProject/sudo_priv)

I then used the following command to gain root access:
![Diagram](https://github.com/jmarti1226/cyber-sec/blob/main/RedTeamProject/python_root)

Flag4 was found using the locate command for flag4:

![Diagram](https://github.com/jmarti1226/cyber-sec/blob/main/RedTeamProject/flag4)