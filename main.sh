#!/bin/bash

backups_dir="./backups"
logfile="./logfile.log"

add_log(){
    action=$1
    current_date=`date +'%Y-%m-%d'`
    current_time=`date +'%H:%M'`
    host=$USER
    echo "$host-$action-$current_date $current_time" >> $logfile
}

if ! [[ -a $logfile ]]; then
    touch $logfile
    add_log 'Se creo el archivo de logs'
fi

if ! [[ -a $backups_dir ]]; then
    mkdir $backups_dir 
    add_log 'Se creo el directorio de backups'  
fi


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
                curl -d "menu=functions&option=storage" -H "Content-Type: application/x-www-form-urlencoded" -X POST http://localhost:8000
                ;;

            2)
                clear
                curl -d "menu=functions&option=info" -H "Content-Type: application/x-www-form-urlencoded" -X POST http://localhost:8000
                ;;
            3)
                clear
                curl -d "menu=functions&option=process" -H "Content-Type: application/x-www-form-urlencoded" -X POST http://localhost:8000
                ;;
            4)
                clear
                curl -d "menu=functions&option=dirs" -H "Content-Type: application/x-www-form-urlencoded" -X POST http://localhost:8000
                ;;
            5)
                clear
                curl -d "menu=functions&option=updates" -H "Content-Type: application/x-www-form-urlencoded" -X POST http://localhost:8000
                ;;
            6)
                clear
                read -p "> Ingrese el nombre del proceso a buscar: " process
                curl -d "menu=functions&option=search&query=$process" -H "Content-Type: application/x-www-form-urlencoded" -X POST http://localhost:8000
                ;;
            7)
                clear
                curl -d "menu=functions&option=ram" -H "Content-Type: application/x-www-form-urlencoded" -X POST http://localhost:8000
                ;;
            8)
                clear
                curl -d "menu=functions&option=network" -H "Content-Type: application/x-www-form-urlencoded" -X POST http://localhost:8000
                ;;
            9)
                clear
                curl -d "menu=functions&option=user" -H "Content-Type: application/x-www-form-urlencoded" -X POST http://localhost:8000
                ;;
            10)
                clear
                curl -d "menu=functions&option=users" -H "Content-Type: application/x-www-form-urlencoded" -X POST http://localhost:8000
                ;;
            11)
                clear;;
        esac    
        if [ $functions_option -ne 11 ]; then
            echo 'Menu de funciones'
            read -p '> Desea realizar otra operacion? (1)si (2)no: ' functions_repeat
            if [ $functions_repeat -eq 2 ]; then
                functions_option=11
            fi
        fi
    done
}

wikidaemon_menu(){
    echo 'Funciones dispibles'
    echo '- Chilate'
    echo '- Python'
    echo '- Reactjs'
    echo '- Horchata'
    echo '- Pupusa'
    echo '- Vim' 
    echo '- Heroku'
    echo '- Empanada'
    echo '- GNU/Linux'
    echo '- Github'
}

wikidaemon_script(){
    wikidaemon_option=0
    while [ $wikidaemon_option -ne 2 ]; do
        echo 'Menu de WikiDaemon'  
        wikidaemon_menu
        read -p '> Ingrese la palabra: ' word
        curl -d "menu=wikidaemon&word=$word" -H "Content-Type: application/x-www-form-urlencoded" -X POST http://localhost:8000
        echo 'Desea realizar otra operacion? (1)si (2)no?'
        read -p '> Ingrese su opcion: ' wikidaemon_repeat
        if [ $wikidaemon_repeat -eq 2 ]; then
            wikidaemon_option=2
        fi
    done
}

_script(){
    wikidaemon_option=0
    while [ $wikidaemon_option -ne 11 ]; do
        echo 'Menu de WikiDaemon'  
        read -p '> Ingrese la palabra: ' word
        read -p "> Ingrese su opcion: " wikidaemon_option
        case $wikidaemon_option in
            1)
                clear
                echo $wikidaemon_option;;
            2)
                clear
                echo $wikidaemon_option;;
            3)
                clear
                echo $wikidaemon_option;;
            4)
                clear
                echo $wikidaemon_option;;
            5)
                clear
                echo $wikidaemon_option;;
            6)
                clear
                echo $wikidaemon_option;;
            7)
                clear
                echo $wikidaemon_option;;
            8)
                clear
                echo $wikidaemon_option;;
            9)
                clear
                echo $wikidaemon_option;;
            10)
                clear
                echo $wikidaemon_option;;
            11)
                clear
        esac    
        if [ $wikidaemon_option -ne 11 ]; then
            echo 'Menu de WikiDaemon'
            read -p '> Desea realizar otra operacion? (1)si (2)no: ' wikidaemon_repeat
            if [ $wikidaemon_repeat -eq 2 ]; then
                wikidaemon_option=11
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
            echo '######################################################################'
            functions_script
            clear;;
        2)
            # Agente inteligente
            clear
            echo '######################################################################'
            wikidaemon_script
            clear;;
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
        echo 'Menu de principal'
        read -p '> Desea realizar otra operacion? (1)si (2)no: ' main_repeat
        if [ $main_repeat -eq 2 ]; then
            main_option=6
        fi
        clear
    fi
done
########################## Fin case 5 ##########################
########################## Begin case 6 ##########################
