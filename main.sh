#!/bin/bash

main_menu(){
    echo 'Menu del demonio'
    echo '(1) Funciones del demonio.'
    echo '(2) WikiDaemon.'
    echo '(3) AWK-Queries.'
    echo '(4) Mantenimiento daemon.'
    echo '(5) Respaldo DB'
    echo '(6) Salir.'
}

# Variable pivote para el menu principal
main_option=0
while [ $main_option -ne 6 ]; do
    # Imprimir menu
    main_menu
    # Capturar opcion
    read -p "> Ingrese su opcion: " main_option
    # Evaluar opcion
    case $main_option in
        1)
            # Funciones personalidas
            clear
            echo $main_option;;
        2)
            # Agente inteligente
            clear
            echo $main_option;;
        3)
            clear
            echo $main_option;;
        4)
            clear
            echo $main_option;;
        5)
            clear
            echo $main_option;;
        6)
            clear;;
    esac 
    if [ $main_option -ne 6 ]; then
        read -p '> Desea realizar otra operacion? (1)si (2)no: ' main_repeat
        if [ $main_repeat -eq 2 ]; then
            main_option=6
        fi
        clear
    fi
done
