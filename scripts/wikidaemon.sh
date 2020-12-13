#!/bin/bash

option=$1
case $option in
    'Chilate')
        echo 'Bebida creada por los salvadoreños la cual contiene extracto de maíz, el cual se le mezcla agua y se convierte en una especie de atol; el cual se acompaña de un dulce de atado o batido de dulce.;'
        echo ''
        ;;
    'Python')
        echo 'Python es un lenguaje de programación interpretado cuya filosofía hace hincapié en la legibilidad de su código. Se trata de un lenguaje de programación multiparadigma, ya que soporta orientación a objetos, programación imperativa y, en menor medida, programación funcional' 
        echo ''
        ;;
    'Reactjs')
        echo 'React (también llamada React.js o ReactJS) es una biblioteca Javascript de código abierto diseñada para crear interfaces de usuario con el objetivo de facilitar el desarrollo de aplicaciones en una sola página. Es mantenido por Facebook y la comunidad de software libre.' 
        echo ''
        ;;
    'Horchata')
        echo 'La horchata de morro es una bebida popular salvadoreña elaborada con una mezcla de especias y semillas como el morro, el cacao, mani, entre otros.' 
        echo ''
        ;;
    'Pupusa')
        echo 'Las pupusas son tortillas hechas de masa de maíz o de arroz rellenas con queso, chicharrón (extracción de la carne de cerdo), frijoles y a las que llamamos “revueltas” (chicharrón con frijoles y queso), camarón y pescado, entre otras opciones.' 
        echo ''
        ;;
    'Vim')
        echo 'Vim (del inglés Vi IMproved) es una versión mejorada del editor de texto Vi, presente en todos los sistemas UNIX. Su autor, Bram Moolenaar, presentó la primera versión en 1991, fecha desde la que ha experimentado muchas mejoras' 
        echo ''
        ;;
    'Heroku')
        echo 'Heroku es una plataforma como servicio de computación en la Nube que soporta distintos lenguajes de programación. Heroku, es una de las primeras plataformas de computación en la nube, que fue desarrollada desde junio de 2007, con el objetivo de soportar solamente el lenguaje de programación Ruby, pero posteriormente se ha extendido el soporte a Java, Node.js, Scala, Clojure y Python.' 
        echo ''
        ;;
    'Empanada')
        echo 'Una empanada es una fina masa de pan, masa quebrada u hojaldre rellena con una preparación salada o dulce y cocida al horno o frita. El relleno puede incluir carnes rojas o blancas, pescado, verduras o fruta.' 
        echo ''
        ;;
    'GNU/Linux')
        echo 'GNU/Linux es la denominación técnica y generalizada que reciben una serie de sistemas operativos de tipo Unix, que también suelen ser de código abierto, multiplataforma, multiusuario y multitarea.' 
        echo ''
        ;;
    'Github')
        echo 'GitHub es una forja (plataforma de desarrollo colaborativo) para alojar proyectos utilizando el sistema de control de versiones Git. Se utiliza principalmente para la creación de código fuente de programas de ordenador.' 
        echo ''
        ;;
    *)
        echo 'No existe la funcion'
        echo 'Desea solicitar otra funcion (1) o desea salir (2).'
        echo ''
        ;;
esac

