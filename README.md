# Labster - Ansible Test Deployment and Backup

### Version
0.0.1

### Tech

* Ansible
* Bash Script

### Execution
Task 1: Deployment process

```sh
$ ansible-playbook deploy.yml -i ~/ansible/hosts -u ubuntu --private-key=<PRIVATEKEYFILE> -e "mysql_root_password=labster"
```

Task 2: Backup process

```sh
$ ansible-playbook backup.yml -i ~/ansible/hosts -u ubuntu --private-key=<PRIVATEKEYFILE> -e "mysql_root_password=labster"
```

### Directory Structure

```sh
vagrant@precise64:~/ansible$ tree -L 4
.
|-- backup.yml
|-- deploy.yml
|-- hosts
|-- README.md
`-- roles
    |-- backup
    |   |-- defaults
    |   |   `-- main.yml
    |   |-- files
    |   |   `-- backup.sh
    |   |-- handlers
    |   |   `-- main.yml
    |   |-- meta
    |   |   `-- main.yml
    |   |-- README.md
    |   |-- tasks
    |   |   `-- main.yml
    |   |-- templates
    |   `-- vars
    |       `-- main.yml
    |-- github
    |   |-- defaults
    |   |   `-- main.yml
    |   |-- files
    |   |-- handlers
    |   |   `-- main.yml
    |   |-- meta
    |   |   `-- main.yml
    |   |-- README.md
    |   |-- tasks
    |   |   `-- main.yml
    |   |-- templates
    |   `-- vars
    |       `-- main.yml
    |-- mysql
    |   |-- defaults
    |   |   `-- main.yml
    |   |-- files
    |   |-- handlers
    |   |   `-- main.yml
    |   |-- meta
    |   |   `-- main.yml
    |   |-- README.md
    |   |-- tasks
    |   |   `-- main.yml
    |   |-- templates
    |   `-- vars
    |       `-- main.yml
    |-- nginx
    |   |-- defaults
    |   |   `-- main.yml
    |   |-- files
    |   |   |-- index.html
    |   |   `-- nginx.conf
    |   |-- handlers
    |   |   `-- main.yml
    |   |-- meta
    |   |   `-- main.yml
    |   |-- README.md
    |   |-- tasks
    |   |   `-- main.yml
    |   |-- templates
    |   `-- vars
    |       `-- main.yml
    |-- php
    |   |-- defaults
    |   |   `-- main.yml
    |   |-- files
    |   |-- handlers
    |   |   `-- main.yml
    |   |-- meta
    |   |   `-- main.yml
    |   |-- README.md
    |   |-- tasks
    |   |   `-- main.yml
    |   |-- templates
    |   `-- vars
    |       `-- main.yml
    `-- wordpress
        |-- defaults
        |   `-- main.yml
        |-- files
        |-- handlers
        |   `-- main.yml
        |-- meta
        |   `-- main.yml
        |-- README.md
        |-- tasks
        |   `-- main.yml
        |-- templates
        `-- vars
            `-- main.yml

49 directories, 43 files
```
License
----

MIT

**Free Software, Hell Yeah!**

