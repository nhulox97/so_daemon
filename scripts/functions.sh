#!/bin/bash

option=$1
case $option in
    'storage')
        df -h | grep ^/dev;;
    'info')
        screenfetch;; # The package mut be installed
    *)
        echo 'No existe la funcion'
esac
