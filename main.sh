#!/bin/bash

# Author: Sergio Bernal (nhulox97)                                     

backups_dir="./backups"
logfile="./logfile.log"
sudopass='dosv2018'

add_log(){
    action=$1
    current_date=`date +'%Y/%m/%d'`
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
                add_log 'Se solicito la funcion: storage'
                ;;

            2)
                clear
                curl -d "menu=functions&option=info" -H "Content-Type: application/x-www-form-urlencoded" -X POST http://localhost:8000
                add_log 'Se solicito la funcion: info'
                ;;
            3)
                clear
                curl -d "menu=functions&option=process" -H "Content-Type: application/x-www-form-urlencoded" -X POST http://localhost:8000
                add_log 'Se solicito la funcion: process'
                ;;
            4)
                clear
                curl -d "menu=functions&option=dirs" -H "Content-Type: application/x-www-form-urlencoded" -X POST http://localhost:8000
                add_log 'Se solicito la funcion: dirs'
                ;;
            5)
                clear
                curl -d "menu=functions&option=updates" -H "Content-Type: application/x-www-form-urlencoded" -X POST http://localhost:8000
                add_log 'Se solicito la funcion: updates'
                ;;
            6)
                clear
                read -p "> Ingrese el nombre del proceso a buscar: " process
                curl -d "menu=functions&option=search&query=$process" -H "Content-Type: application/x-www-form-urlencoded" -X POST http://localhost:8000
                add_log "Se solicito la funcion: search, proceso: $process"
                ;;
            7)
                clear
                curl -d "menu=functions&option=ram" -H "Content-Type: application/x-www-form-urlencoded" -X POST http://localhost:8000
                add_log 'Se solicito la funcion: ram'
                ;;
            8)
                clear
                curl -d "menu=functions&option=network" -H "Content-Type: application/x-www-form-urlencoded" -X POST http://localhost:8000
                add_log 'Se solicito la funcion: network'
                ;;
            9)
                clear
                curl -d "menu=functions&option=user" -H "Content-Type: application/x-www-form-urlencoded" -X POST http://localhost:8000
                add_log 'Se solicito la funcion: user'
                ;;
            10)
                clear
                curl -d "menu=functions&option=users" -H "Content-Type: application/x-www-form-urlencoded" -X POST http://localhost:8000
                add_log 'Se solicito la funcion: users'
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
        add_log "Se consulto la funcion: $word"
        echo 'Desea realizar otra operacion? (1)si (2)no?'
        read -p '> Ingrese su opcion: ' wikidaemon_repeat
        if [ $wikidaemon_repeat -eq 2 ]; then
            wikidaemon_option=2
        fi
    done
}

_script(){
    maintenance_option=0
    while [ $maintenance_option -ne 11 ]; do
        echo 'Menu de WikiDaemon'  
        read -p '> Ingrese la palabra: ' word
        read -p "> Ingrese su opcion: " maintenance_option
        case $maintenance_option in
            1)
                clear
                echo $maintenance_option;;
            2)
                clear
                echo $maintenance_option;;
            3)
                clear
                echo $maintenance_option;;
            4)
                clear
                echo $maintenance_option;;
            5)
                clear
                echo $maintenance_option;;
            6)
                clear
                echo $maintenance_option;;
            7)
                clear
                echo $maintenance_option;;
            8)
                clear
                echo $maintenance_option;;
            9)
                clear
                echo $maintenance_option;;
            10)
                clear
                echo $maintenance_option;;
            11)
                clear
        esac    
        if [ $maintenance_option -ne 11 ]; then
            echo 'Menu de WikiDaemon'
            read -p '> Desea realizar otra operacion? (1)si (2)no: ' wikidaemon_repeat
            if [ $wikidaemon_repeat -eq 2 ]; then
                maintenance_option=11
            fi
        fi
    done
}

backup_script() {
    password='dosv2018'
    user='nhulox97'

    echo 'Menu de backup'
    echo ''
    echo 'Bases de datos disponibles'
    mysql --user=$user --password=$password -e 'show databases;'
    read -p '> Ingrese el nombre de la base de datos a respaldar: ' db
    echo ''
    read -p '> Ingrese el correo al que se enviara el backup: ' receiver
    curl -d "menu=backup&db=$db&receiver=$receiver" -H "Content-Type: application/x-www-form-urlencoded" -X POST http://localhost:8000
    add_log "Se hizo el backup de la db: $db, se envio a: $receiver"
}


maintenance_menu(){
    echo 'Menu de mantenimiento'
    echo '(1) Enviar archivo de logs'
    echo '(2) Enviar respaldo a equipo remoto'
    echo '(3) Detener servicio'
    echo '(4) Reiniciar servicio'
    echo '(5) Ver estado del servicio'
    echo '(6) Salir'
}

maintenance_script(){
    maintenance_option=0
    while [ $maintenance_option -ne 6 ]; do
        maintenance_menu
        read -p "> Ingrese su opcion: " maintenance_option
        case $maintenance_option in
            1)
                clear
                read -p '> Ingrese el correo al que se enviara el backup: ' receiver
                curl -d "menu=maintenance&option=log&receiver=$receiver" -H "Content-Type: application/x-www-form-urlencoded" -X POST http://localhost:8000
                add_log "Se envio el archivo log a: $receiver"
                echo ''
                ;;
            2)
                clear
                echo $maintenance_option;;
            3)
                clear
                echo $sudopass | sudo -S systemctl stop sergiodaemon
                add_log 'Se detuvo el demonio'
                echo '' 
                ;;
            4)
                clear
                echo $sudopass | sudo -S systemctl restart sergiodaemon
                add_log 'Se reinicio el demonio'
                echo '' 
                ;;
            5)
                clear
                echo $sudopass | sudo -S systemctl status sergiodaemon
                add_log 'Se detuvo el demonio'
                echo ''
                ;;
            6)
                clear
                echo ''
                ;;
            *)
                clear
                echo 'Opcion invalida'
                ;;
        esac    
        if [ $maintenance_option -ne 6 ]; then
            echo 'Menu de mantenimiento'
            read -p '> Desea realizar otra operacion? (1)si (2)no: ' maintenance_repeat
            if [ $maintenance_repeat -eq 2 ]; then
                maintenance_option=6
            fi
        fi
    done

}

awk_menu(){
    echo 'Menu de AWK-Queries'
    echo '(1) Consultar por nombres o apellidos'
    echo '(2) Consultar por fecha de registro'
    echo '(3) Contar numero total de registros'
    echo '(4) Mostrar registros que no esten completos'
    echo '(5) Mostrar registros con campos NULL'
    echo '(6) Contar numero de estudiantes de INGENIERIA CIVIL'
    echo '(7) Ordenar por nombre'
    echo '(8) Ordenar por apellido'
    echo '(9) Ordenar por carrera'
    echo '(10) Salir'
}

awk_scripts(){
    awk_option=0
    file='./data.csv'
    while [ $awk_option -ne 10 ]; do
        awk_menu
        read -p "> Ingrese su opcion: " awk_option
        case $awk_option in
            1)
                clear
                echo 'Consular por nombre(1)'
                echo 'Consular por apellido(2)'
                read -p '> Ingrese su opcion: ' query_option
                if [ $query_option -eq 1 ] || [ $query_option -eq 2 ]; then
                    if [ $query_option -eq 1 ];then
                        read -p '> Ingrese el nombre a buscar: ' query
                        awk -F"," -v name="$query" 'BEGIN {print "Buscar registro por nombre"; name=toupper(name)} {
                            split(toupper($2),splitted_name," ");
                            if (name == $2 || name == splitted_name[1] || name == splitted_name[2]) { print $0 }
                        } END {print "Resultados para el nombre: ", name}' $file
                        # curl -d "menu=awk&option=$awk_option" -H "Content-Type: application/x-www-form-urlencoded" -X POST http://localhost:8000
                        add_log "Se consulto con awk por el nombre: $query"
                    elif [ $query_option -eq 2 ];then
                        read -p '> Ingrese el apellido a buscar: ' query
                        awk -F"," -v lastname="$query" 'BEGIN {print "Buscar registro por apellido"; lastname=toupper(lastname)} {
                            split(toupper($1),splitted_name," ");
                            if (lastname == $1 || lastname == splitted_name[1] || lastname == splitted_name[2]) { print $0 }
                        } END {print "Resultados para el apellido: ", lastname}' $file
                        # curl -d "menu=awk&option=$awk_option" -H "Content-Type: application/x-www-form-urlencoded" -X POST http://localhost:8000
                        add_log "Se consulto con awk por el apellido: $query"
                    fi
                else
                    echo 'Opcion incorrecta'
                    echo ''
                fi
                ;;
            2)
                clear
                awk -F"," 'BEGIN {print "Head"} {print $1} END {print "Foot"}' $file
                # curl -d "menu=awk&option=$awk_option" -H "Content-Type: application/x-www-form-urlencoded" -X POST http://localhost:8000
                add_log 'Se consulto con awk por fecha de registro'
                ;;
            3)
                clear
                awk -F"," 'BEGIN { print "Contar numerto toal de registros" } END {print "Numero de registros: ", NR}' $file
                # curl -d "menu=awk&option=$awk_option" -H "Content-Type: application/x-www-form-urlencoded" -X POST http://localhost:8000
                add_log 'Se consulto con awk el numero total de registros'
                ;;
            4)
                clear
                awk -F"," 'BEGIN {print "Registros con campos vacios"} {
                if ($1 == "" || $2 == "" || $3 == "" || $4 == "" || $5 == "" || $6 == "" || $7 == "") {
                    print $0
                } }' $file
                # curl -d "menu=awk&option=$awk_option" -H "Content-Type: application/x-www-form-urlencoded" -X POST http://localhost:8000
                add_log 'Se consulto con awk registros incompletos'
                ;;
            5)
                clear
                awk -F"," 'BEGIN {print "Registros con campos NULL"} {
                if ($1 == "NULL" || $2 == "NULL" || $3 == "NULL" || $4 == "NULL" || $5 == "NULL" || $6 == "NULL" || $7 == "NULL") {
                    print $0
                }}' $file
            # curl -d "menu=awk&option=$awk_option" -H "Content-Type: application/x-www-form-urlencoded" -X POST http://localhost:8000
                add_log 'Se consulto con awk registros con campos NULL'
                ;;
            6)
                clear
                awk -F"," 'BEGIN {print "Total de estudiantes de INGENIERIA CIVIL"} {
                carrera=toupper($7)
                if (carrera == "INGENIERIA CIVIL") {
                    counter++
                }
                } END {print "Total estudiantes: ", counter}' $file
                # curl -d "menu=awk&option=$awk_option" -H "Content-Type: application/x-www-form-urlencoded" -X POST http://localhost:8000
                add_log 'Se consulto con awk el numero de estudiantes de ingenieria civil'
                ;;
            7)
                clear
                awk -F"," 'BEGIN {print "Ordenar por nombre"} {print $2 |"sort -u"}' $file
                # curl -d "menu=awk&option=$awk_option" -H "Content-Type: application/x-www-form-urlencoded" -X POST http://localhost:8000
                add_log 'Se consulto con awk por registros ordenados por nombre'
                ;;
            8)
                clear
                awk -F"," 'BEGIN {print "Ordenar por apellido"} {print $1 |"sort -u"}' $file
                # curl -d "menu=awk&option=$awk_option" -H "Content-Type: application/x-www-form-urlencoded" -X POST http://localhost:8000
                add_log 'Se consulto con awk por registros ordenados por apellido'
                ;;
            9)
                clear
                awk -F"," 'BEGIN {print "Ordenar por carrera"} {print $7 |"sort -u"}' $file
                # curl -d "menu=awk&option=$awk_option" -H "Content-Type: application/x-www-form-urlencoded" -X POST http://localhost:8000
                add_log 'Se consulto con awk por registros ordenados por carrera'
                ;;
            10)
                clear
                ;;
            *)
                echo 'Opcion invalida'
                ;;
        esac    
        if [ $awk_option -ne 10 ]; then
            echo 'Menu de AWK-Queries'
            read -p '> Desea realizar otra operacion? (1)si (2)no: ' awk_repeat
            if [ $awk_repeat -eq 2 ]; then
                awk_option=10
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
            echo 'Saliendo de las funciones del demonio'
            echo '######################################################################'
            echo ''
            ;;
        2)
            # Agente inteligente
            clear
            echo '######################################################################'
            wikidaemon_script
            echo 'Saliendo de la wiki del demonio'
            echo '######################################################################'
            echo ''
            ;;
        3)
            clear
            echo '######################################################################'
            awk_scripts
            echo 'Saliendo de AWK-Queries del demonio'
            echo '######################################################################'
            echo ''
            ;;
        4)
            # mantenimiento
            clear
            echo '######################################################################'
            maintenance_script
            echo 'Saliendo del mantenimiento del demonio'
            echo ''
            ;;
        5)
            # backup
            echo '######################################################################'
            backup_script
            echo 'Saliendo del backup del demonio'
            echo '######################################################################'
            echo ''
            ;;
        6) 
            clear;;
        *)
            echo 'Opcion invalida'
            ;;
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
