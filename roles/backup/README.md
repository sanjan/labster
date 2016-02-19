Task 2: Backup
==============

Create backup rotation.

Requirements
------------
Backup MySql Databases and configuration for NginX and CMS applications

Role Variables
--------------

For MySql credentials the script uses a couple of variables
- mysql username
- mysql password

Workflow of the playbook
-------------------------

This playbook will copy and run a Bash script that will perform the backup tasks


Playbook tasks
--------------

```sh

Step 1:
The script checks terminates if couple of conditons are not met
- 1. number of supplied arguments < 2
- 2. current load average of the system > 2.00

Step 2:
Create backup directories

Step 3: 
For every user database in mysql create an sql dump file compress it
keep only the 7 most recent files for each database

Step 4: 
Backup the Nginx config file and compress it
keep only the 7 most recent files

Step 5: 
Backup the Wordpress config file and compress it
keep only the 7 most recent files

```

License
-------

MIT License
