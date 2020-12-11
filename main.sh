#!/bin/bash

main_option=0

while [ $main_option -ne  2 ]; do
    read -p "> Ingrese su opcion: " main_option
    case $main_option in
        1)
            clear
            echo $main_option;;
        2)
            clear;;
    esac 
    if [ $main_option -ne 2 ]; then
        read -p '> Desea realizar otra operacion? (1)si (2)no: ' main_option
        clear
    fi
done
