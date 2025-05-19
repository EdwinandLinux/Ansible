# I - Ansible Setup on wmware with RHEL

# II - Inventory in Ansible
### 1 - What is Ansible?
```
Ansible is a free and open source engine that automates remotes system and ensures they meet the desired state. It establishes connection between node using SSH.
```
### 2 - What is Control Node?
```
Control Node is the machine where Ansible is installed.
```
### 3 - What  is Managed Node?
```
Managed Node is a host or system that is managed by the Control Node.
```
### 4 - What is Playbook?
```
Playbook is a Yammel configuration file that uses a human readable language to describe automation jobs.
```
### 5 - What is an **inventory**?
```
An inventory is a file that lists the hosts(servers) that you want Ansible to manage.
```
### 6 - Create an inventory
```
sudo mkdir ansible
cd ansible
vim invertory.ini
```
# III - Ansible configuration file
### a - What is a configuration file in Ansible?
```
In Ansible, configuration file is used to defined various settings that control how Ansible operates. It typically named ansible.cfg .
```
### b - Create Ansible configuration file
```
cd ansible
vim ansible.cfg
```
### c - Details of the configuration file

##### *[defaults]*
   - Section that sets the default behavior of Ansible when running a **playbook** or **ad-hoc commands**.

##### *inventory= ./inventory.ini* 
 - Tell Ansible to use **inventory.ini** in the current directory as the inventory file.
 - This file lists the **hosts** that Ansible is going to manage.
 - This file can be in **ini** or **yaml** format.

##### *remote_user = ansible*
 - This is the **default ssh user** Ansible uses to connect to the remote hosts.

 ##### *ask_pass*
  - This tell Ansible **not to ask for the ssh password**.
  - It assumes that you are using **ssh key-based authentification**.

##### *[privilege_escalation]*
 - This controle **how Ansible gets elevated access** on the target machines.

 ##### *become = true*
  - Enables *privilege escalation*.

  ##### *become_method = sudo*
   - The method Ansible uses to escalate privileges.

##### *become_user = root*
- The user Ansible will try to become **root**.

##### *become_ask_pass = false*
 - Tell Ansible **not to prompt for the sudo password** 
 - This will work if the **ansible user** can run sudo **without a password** ( need to add ansible user to the /etc/sudoers with **ALL=(ALL)  NOPASSWD: ALL**).

 # A - Project : Create a Simple File on a Server with Ansible

This project demonstrates how to use Ansible to create a simple file on a remote server.

## Prerequisites

- Ansible installed on your control node.
- SSH access to the target server(s).
- Inventory file listing the target hosts.

## Ansible Playbook
```
- name: Create a simple file on a serverb
  hosts: serverb
  tasks:
    - name: Create a simple file with content on serverb
      file:
        path: /tmp/file-playbook1
       state: touch
```
# B - Project: Apache Installation with Ansible
This project uses Ansible to automate the installation and configuration of the Apache HTTP server on two server.

🚀 Requirements
. Ansible installed on your control machine (your laptop or a bastion host)

. SSH access to the target node

. Python installed on the target node

. A user on the target node with sudo privileges

# C - Project: Nginx Installation and User Setup with Hard Link

## 📋 Description

This Ansible project  performs the following actions using **two separate plays**:

1. **Play 1**: Installs **Nginx** on the host group named `webserver`.
2. **Play 2**: On a different host group named `otherserver`, it:
   - Creates a Linux user.
   - Creates a file.
   - Creates a **hard link** to the file.

---

## 🖥️ Inventory Setup

Make sure your `inventory.ini` file looks like this:

```ini
[webserver]
192.168.1.10

[otherserver]
192.168.1.20
