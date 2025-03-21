# Ansible Playbook for SELinux and Firewall Configuration

## Overview

1. This Ansible playbook consists of two plays:
    1. **SELinux Configuration:** Ensures SELinux is set to enforcing mode.
    2. **Firewall Configuration:** Installs, enables, and configures firewalld to allow essential services (HTTP, HTTPS, and SSH).

## Requirements
1. Installation and Configuration:
    - Ansible installed on the control node.
    - Target machines running Red Hat Enterprise Linux (RHEL) or compatible distributions.
    - SSH access to target machines with sudo privileges.

## Playbook details
#### First Play
1. SELinux Play
    1. Ensures SELinux is set to enforcing mode.
    2. If changes are made, the system reboots to apply them.

#### Second Play
1. Firewall Play
    1. Ensures SELinux is set to enforcing mode.
    2. Installs firewalld (if not present).
    3. Allows traffic for:(HTTP (80) , HTTPS (443) , SSH (22))
    4. Reloads firewalld to apply changes.

  ## Usage
  1. Run the playbook:

  `` ansible-playbook two_plays.yml``