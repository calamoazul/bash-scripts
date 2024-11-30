#!/bin/bash

function help()
{
    echo -e "Programa para mostrar documentación de diversos entornos"
    echo -e "------------"
    echo -e "ARGUMENTOS":
    echo -e "------------"
    echo -e "laravel: Abre documentación de laravel"
    echo -e "vue: Abre documentación de vue"
    echo -e "algoritmos: documentación en inglés de principales algoritmos de lógica"
    echo -e "angular: Abre documentación de Angular"
    echo -e "symfony: Abre documentación de Symfony"
    echo -e "php: Abre documentación de php"
    echo -e "wordpress: Abre documentación de WordPress"
    echo -e "------------"
    echo -e "OPCIONES":
    echo -e "------------"
    echo -e "--help: Abre el manual de ayuda"
}
if [[ $# -ne 1 ]]; then
    echo -e "El programa necesita un argumento"
else
    if [[ $1 == 'laravel' ]]; then
        echo -e "Abriendo documentación de Laravel\n"
        sleep 1
        xdg-open https://laravel.com/docs/11.x/readme > /dev/null 2>&1
    elif [[ $1 == 'vue' ]]; then
        echo -e "Abriendo documentación de Vue\n"
        sleep
        xdg-open https://vuejs.org/guide/introduction.html > /dev/null 2>&1
    elif [[ $1 == 'algoritmos' ]]; then
        echo -e "Abriendo documentacion de Algoritmos"
        sleep 1
        xdg-open https://algorithm-visualizer.org/ > /dev/null 2>&1
    elif [[ $1 == 'angular' ]]; then
        echo -e "Abriendo documentación de Angular"
        sleep 1
        xdg-open https://angular.dev/overview > /dev/null 2>&1
    elif [[ $1 == 'symfony' ]]; then
        echo -e "Abriendo documentación de Symfony"
        sleep 1
        xdg-open https://symfony.com/doc/current/index.html > /dev/null 2>&1
    elif [[ $1 == 'php' ]]; then
        echo -e  "Abriendo documentación de php"
        sleep 1
        xdg-open https://www.php.net/manual/es/language.basic-syntax.php > /dev/null 2>&1
    elif [[ $1 == 'wordpress' ]];then
        echo -e "Abriendo documentación de WordPress"
        sleep 1
        xdg-open https://developer.wordpress.org/ > /dev/null 2>&1
    elif [[ $1 == '--help' ]]; then
        help
    fi
fi
exit 0