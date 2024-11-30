#!/bin/bash

#Menú de ayuda

function help()
{
    help="Exportador a excel [-u url] [-o output] [-h Menú de ayuda]\n
    -u: Url de la API a la que gestionar recursos\n
    -o: Ruta absoluta donde quieras crear el excel\n
    -h: Mostrar menú de ayuda\n"

    echo -e $help
}


url=""
output=""

# Recoger los argumentos con variables
# Mostrar errores con parámetros invalidos
while getopts 'u:o:h' opt; do 
    case ${opt} in
    u)
        url=$OPTARG
        ;;
    o)
        output=$OPTARG
        ;;
    h)
        help
        exit 0
        ;;
    ?)
        echo -e "Argumento inválido"
        exit 1;;
    esac
done

# Ejecutar el script php si los parámetros son correctos
# El script de php realiza sus propias validaciones y manda sus mensajes de error

if [[ -n $url && -n $output ]]; then
    php export.php $url $output 
    ok=$?
    case $ok in
    0)
        echo -e "Exportación con éxito"
        exit 0
        ;;
    1)
        echo -e "Ha ocurrido un error al importar"
        exit 1
        ;;
    2)
        echo -e "Ha ocurrido un error al importar"
        exit 1
        ;;
    255)
        echo -e "Ha ocurrido un error al importar"
        exit 1
        ;;    
    esac
else
    echo -e "Los parámetros no son válidos"
    exit 1;
fi