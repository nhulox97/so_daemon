#!/bin/bash

main_menu(){
    echo 'Menu del demonio'
    echo '(1) Funciones del demonio'
    echo '(2) WikiDaemon'
    echo '(3) AWK-Queries'
    echo '(4) Mantenimiento daemon'
    echo '(5) Respaldo DB'
    echo '(6) Salir'
}

functions_menu(){
    echo '######################################################################'
    echo 'Menu de funciones del demonio'
    echo '(1) Capacidad de almacenamiento'
    echo '(2) Ver informacion acerca de la distro'
    echo '(3) Listar procesos en ejecucion'
    echo '(4) Listar directorios de home'
    echo '(5) Ver actualizaciones disponibles'
    echo '(6) Buscar proceso'
    echo '(7) Mostrar informacion de la memoria RAM'
    echo '(8) Mostrar interfaces de red disponibles' # nmcli device status
    echo '(9) Mostrar usuario actual del sistema' # tentativo
    echo '(10) Listar usuarios del sistema'
    echo '(11) Salir'
}

functions_script(){
    functions_option=0
    while [ $functions_option -ne 11 ]; do
        functions_menu
        read -p "> Ingrese su opcion: " functions_option
        case $functions_option in
            1)
                clear
                echo $functions_option;;
            2)
                clear
                echo $functions_option;;
            3)
                clear
                echo $functions_option;;
            4)
                clear
                echo $functions_option;;
            5)
                clear
                echo $functions_option;;
            6)
                clear
                echo $functions_option;;
            7)
                clear
                echo $functions_option;;
            8)
                clear
                echo $functions_option;;
            9)
                clear
                echo $functions_option;;
            10)
                clear
                echo $functions_option;;
            11)
                clear
        esac    
        if [ $functions_option -ne 11 ]; then
            echo 'Salir menu de funciones'
            read -p '> Desea realizar otra operacion? (1)si (2)no: ' functions_repeat
            if [ $functions_repeat -eq 2 ]; then
                functions_option=11
            fi
        fi
    done
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
            # daemon functions 
            clear
            functions_script
            clear;;
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
        6) clear
            clear;;
    esac 
    if [ $main_option -ne 6 ]; then
        echo 'Salir menu de principal'
        read -p '> Desea realizar otra operacion? (1)si (2)no: ' main_repeat
        if [ $main_repeat -eq 2 ]; then
            main_option=6
        fi
        clear
    fi
done
########################## Fin case 5 ##########################
########################## Begin case 6 ##########################
