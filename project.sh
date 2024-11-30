#!/bin/bash


if [ $# -ne 1 ]; then

    echo -e 'El programa necesita un argumento para ejecutarse';
    exit 1

else

    project=$1
    ruta="$DIR_PROJECTS/$project"

    if [[ ! -d $ruta ]]; then
        echo -e "El directorio no existe"
        echo $ruta
        exit 1
    else
        cd $ruta && code './' > '/dev/null' 2>&1
        exit 0
    fi
fi