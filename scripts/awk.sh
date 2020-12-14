#!/bin/bash

option=$1
file='../data.csv'

case $option in
    1)
        #query=`awk '{print "Esto es una prueba usando awk "}'`        
        #echo "$query"
        query=`awk -F"," 'BEGIN {print "Head"} {print $1} END {print "Foot"}' $file`
        echo "$query"
        ;;
    2)
        echo 'Case 1'
        ;;
    3)
        echo 'Case 1'
        ;;
    4)
        echo 'Case 1'
        ;;
    5)
        echo 'Case 1'
        ;;
    6)
        echo 'Case 1'
        ;;
    7)
        echo 'Case 1'
        ;;
    8)
        echo 'Case 1'
        ;;
    9)
        echo 'Case 1'
        ;;
    *)
        echo 'Opcion invalida'
        ;;
esac
