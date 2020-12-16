#!/bin/bash

db_name="$1"
receiver="$2"
password='dosv2018'
user='nhulox97'
current=`pwd`
backups_dir="$current/backups"
date=`date '+%Y%m%d-%H%M'` # no usar ':' en filenames eso da error porque esa sintaxis se usa para hacer referencia a un puerto o un host remoto
current_date=`date +'%Y-%m-%d'`
current_time=`date +'%H:%M'`

mysql=`ps awx | grep 'mysql' |grep -v grep|wc -l`

if [ $mysql == 0  ]; then
    if [[ "$(whoami)" != root ]]; then
        echo 'Mysql esta detenido, pero el usuario no tiene permisos para reiniciar el servicio'
        exit 1
    else
        service mysql restart
        echo 'Se reinicio el servicio.'
    fi
fi

find $backups_dir/[a-z]* -name \*.sql -mtime +3 -exec rm {} \;
find $backups_dir/[a-z]* -name \*.tar.bz2 -mtime +3 -exec rm {} \;

dump_file="dump-$db_name-$date.sql"
mysqldump --user=$user --password=$password $db_name > "$backups_dir/$dump_file"

backup_file="backup-$db_name-$date.tar.bz2"
cd $backups_dir
tar -cvzf "$backup_file" "$dump_file" 
ls
echo "Backup Database: $db_name. Backup Date: $current_date $current_time" | mutt -a "$backup_file" -s "Backup: $db_name" -- $receiver
echo "Backup realizado correctamenete. db: $db_name; receiver: $receiver"
