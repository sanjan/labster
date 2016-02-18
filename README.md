# Labster - Ansible Test Deployment and Backup

### Version
0.0.1

### Tech

* Ansible
* Bash Script

### Execution
Task 1: Deployment process

```sh
$ ansible-playbook deploy.yml -i ~/ansible/hosts -u ubuntu --private-key=<PRIVATEKEYFILE> -e "mysql_root_password=<PASSWORD>"
```

Task 2: Backup process

```sh
$ ansible-playbook backup.yml -i ~/ansible/hosts -u ubuntu --private-key=~/.ssh/<PRIVATEKEYFILE> -e "mysql_root_password=<PASSWORD>"
```

License
----

MIT

**Free Software, Hell Yeah!**

