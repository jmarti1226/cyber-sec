## Automated ELK Stack Deployment

The files in this repository were used to configure the network depicted below.

![Diagram](https://github.com/jmarti1226/cyber-sec/blob/main/Diagrams/ELK_Stack_Project_1_Day_2.jpg)

These files have been tested and used to generate a live ELK deployment on Azure. They can be used to either recreate the entire deployment pictured above. Alternatively, select portions of the playbook file may be used to install only certain pieces of it, such as Filebeat.

  - ![Filebeat Playbook](https://github.com/jmarti1226/cyber-sec/blob/main/Ansible/filebeat-playbook.yml)
  - ![Metricbeat Playbook](https://github.com/jmarti1226/cyber-sec/blob/main/Ansible/metricbeat-playbook.yml)
  - ![Install ELK Playbook](https://github.com/jmarti1226/cyber-sec/blob/main/Ansible/install-elk.yml)

This document contains the following details:
- Description of the Topology
- Access Policies
- ELK Configuration
  - Beats in Use
  - Machines Being Monitored
- How to Use the Ansible Build


### Description of the Topology

The main purpose of this network is to expose a load-balanced and monitored instance of DVWA, the D*mn Vulnerable Web Application.

Load balancing ensures that the application will be highly reliable, in addition to restricting traffic to the network.
The load balancer provides an external IP address, thereby protecting the individual servers from public access.The load balancer receives any traffic that comes into the website and distributes it across multiple servers. Using a jump box allows us to deploy containers to each server at once rather than accessing each individual server.

Integrating an ELK server allows users to easily monitor the vulnerable VMs for changes to the logs and system metrics.
Filebeat collects data about the file system. 
Metricbeat collects machine metrics.

The configuration details of each machine may be found below:

| Name     | Function | IP Address | Operating System |
|----------|----------|------------|------------------|
| Jump Box | Gateway  | 10.0.0.1   | Linux            |
| Web1     | Server   | 10.0.0.7   | Linux            |
| Web2     | Server   | 10.0.0.8   | Linux            |
| Web-3    | Server   | 10.0.0.5   | Linux            |

### Access Policies

The machines on the internal network are not exposed to the public Internet. 

Only the Load Balancer can accept connections from the Internet. Access to this machine is only allowed from the following IP addresses:
- For this setup only my personal IP addresses is allowed.

Machines within the network can only be accessed by the Jump Box Machine.
- IP address: 40.122.166.112

A summary of the access policies in place can be found in the table below.

| Name     | Publicly Accessible | Allowed IP Addresses       |
|----------|---------------------|----------------------------|
| Jump Box | No                  | 10.0.0.7 10.0.0.8 10.0.0.5 |

### Elk Configuration

Ansible was used to automate configuration of the ELK machine. No configuration was performed manually, which is advantageous because it will ensure the provisioning scripts run identically everywhere. This will further ensure our automated configurations will do exactly the same thing every time they run, eliminating as much variability between configurations as possible.

The playbook implements the following tasks:
- Installs docker.io
- Installs python
- Installs docker container named elk

The following screenshot displays the result of running `docker ps` after successfully configuring the ELK instance.

![Docker ps output](https://github.com/jmarti1226/cyber-sec/blob/main/Ansible/ELK_docker_ps_output.png)

### Target Machines & Beats
This ELK server is configured to monitor the following machines:
- Web1 10.0.0.7
- Web2 10.0.0.8
- Web3 10.0.0.5

We have installed the following Beats on these machines:
- Filebeat
- Metricbeat

These Beats allow us to collect the following information from each machine:
- Filebeat collects data about the file system. 
- Metricbeat collects machine metrics.

### Using the Playbook
In order to use the playbook, you will need to have an Ansible control node already configured. Assuming you have such a control node provisioned: 

SSH into the control node and follow the steps below:
- Copy the filebeat-playbook.yml file to /etc/ansible.
- Update the configuration file to include the IP address of the ELK VM
- Run the playbook, and navigate to http://[ELK.VM.IP]:5601/app/kibana to check that the installation worked as expected.
