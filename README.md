# I - Ansible Setup on wmware with RHEL

# II - Inventory
### 1 - What is an **inventory**?
```
An inventory is a file that lists the hosts(servers) that you want Ansible to manage.
```
### 2 - Create an inventory
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
   - Section that sets the default behavior of Ansible when running a **playbook** or **ad-hoc commands**

##### *inventory= ./inventory.ini* 
 - Tell Ansible to use **inventory.ini** in the current directory as the inventory file.
 - This file lists the **hosts** that Ansible is going to manage.
 - This file can be in **ini** or **yaml** format.

##### *remote_user = ansible*
 - This is the **default ssh user** Ansible uses to connect to the remote hosts.

 ##### *ask_pass*
  - This tell Ansible **not to ask for the ssh password**
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
 - This will work if the **ansible user** can run sudo **without a password** ( need to add ansible user in the /etc/sudoers with **ALL=(ALL)  NOPASSWD: ALL**)





