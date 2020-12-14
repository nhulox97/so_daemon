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
    'remote')
        screenfetch;; # The package mut be installed
    'stop')
        top -b -n 1 > temp.txt
        less temp.txt
        rm temp.txt
        ;;
    'restart')
        ls -l $HOME | grep "^d";;
    *)
        echo 'No existe la funcion';;
esac

