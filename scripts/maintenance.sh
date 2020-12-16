#!/bin/bash

option=$1
case $option in
    'log')
        current_date=`date +'%Y-%m-%d'`
        current_time=`date +'%H:%M'`
        receiver=$2
        logfile='./logfile.log'
        echo "Logfile: $logfile.  Date: $current_date $current_time" | mutt -a "$logfile" -s "Logfile: $logfile" -- $receiver
        echo 'Logfile enviado correctamente'
        ;;
    'backup')
        date=`date '+%Y%m%d-%H%M'` # no usar ':' en filenames eso da error porque esa sintaxis se usa para hacer referencia a un puerto o un host remoto
        current_date=`date +'%Y-%m-%d'`
        current_time=`date +'%H:%M'`
        current_dir=`pwd`
        # cd $current_dir 
        backups_dir='./backups/'
        find ./[a-z]* -name \*.tar.bz2 -mtime +3 -exec rm {} \;
        backup_file="backup-$date.tar.bz2"
        tar -czvf "$backup_file" "$backups_dir"
        #  echo "Backup realizado con exito. Fue enviado a: $receiver"
        ;; # The package mut be installed
    *)
        echo 'No existe la funcion';;
esac

