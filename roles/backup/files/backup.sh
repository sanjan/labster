#!/bin/bash


DBUSER="$1"
DBPASSWORD="$2"
mysql_backupdir="/backup/mysql"
nginx_backupdir="/backup/nginx"
wordpress_backupdir="/backup/wordpress"
nginx_config=/etc/nginx/sites-available/default
wordpress_config=/usr/share/nginx/html/wordpress/wp-config.php


# process mysql backups

function proc_mysql {
databases=`mysql --user=$DBUSER --password=$DBPASSWORD -e "SHOW DATABASES;" | tr -d "| " | grep -v Database`
for db in $databases; do
    if [[ "$db" != "information_schema" ]] && [[ "$db" != _* ]] ; then
        echo "Dumping database: $db"
        mysqldump --force --opt --user=$DBUSER --password=$DBPASSWORD --databases $db > $mysql_backupdir/$db.$(date +%Y%m%d%H%M%S).sql
        gzip -1 $mysql_backupdir/$db.*.sql
    fi
done
cd $mysql_backupdir; ls -1tp | grep -v "/" | tail -n +8 | xargs -I {} rm -- {};
}

#process nginx backups

function proc_nginx {
cp -v $nginx_config $nginx_backupdir/nginx.$(date +%Y%m%d%H%M%S).conf
gzip -1 $nginx_backupdir/nginx.*.conf
cd $nginx_backupdir; ls -1tp | grep -v "/" | tail -n +8 | xargs -I {} rm -- {};
}

#process wordpress backups

function proc_wordpress {
cp -v $wordpress_config $wordpress_backupdir/wordpress.$(date +%Y%m%d%H%M%S).conf
gzip -1 $wordpress_backupdir/wordpress.*.conf
cd $wordpress_backupdir; ls -1tp | grep -v "/" | tail -n +8 | xargs -I {} rm -- {};
}


#check if arguments are available
if [[ $# -lt 2 ]];then
echo
echo "Usage: $0 db_username db_password"
echo
exit 1
fi

#check current server load
trigger=2.00
load=$(cat /proc/loadavg | awk '{print $1}')
response=$(echo | awk -v T=$trigger -v L=$load 'BEGIN{if ( L > T){ print "greater"}}')

if [[ $response = "greater" ]]
then
echo "current server load is above 2. exiting."
exit 1
fi

#perform backups
mkdir -p $mysql_backupdir $nginx_backupdir $wordpress_backupdir
proc_mysql
proc_nginx
proc_wordpress
exit 0
