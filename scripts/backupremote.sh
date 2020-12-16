#!/bin/bash

date=`date '+%Y%m%d-%H%M'` # no usar ':' en filenames eso da error porque esa sintaxis se usa para hacer referencia a un puerto o un host remoto
current_date=`date +'%Y-%m-%d'`
current_time=`date +'%H:%M'`
current_dir=`pwd`
# cd $current_dir 
backups_dir='./backups/'
find ./[a-z]* -name \*.tar.bz2 -mtime +3 -exec rm {} \;
backup_file="backup-$date.tar.bz2"
tar -czvf "$backup_file" "$backups_dir"

sleep 5
rm "$backup_file"
