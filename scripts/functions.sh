#!/bin/bash

option=$1
case $option in
    'storage')
        df -h | grep ^/dev;;
    'info')
        screenfetch;; # The package mut be installed
    'process')
        top -b -n 1 > temp.txt
        less temp.txt
        rm temp.txt
        ;;
    'dirs')
        ls -l $HOME | grep "^d";;
    'updates')
        apt list --upgradable
        ;;
    'search')
        process=$2
        ps -ax | grep $process
        ;;
    'ram')
        free -m
        ;;
    'network')
        nmcli device status
        ;;
    'user')
        echo "Usuario actual: $USER"
        echo ''
        ;;
    'users')
        getent passwd | awk -F: '{print $1, "-", $5}'
        ;;
    *)
        echo 'No existe la funcion'
esac
