#!/bin/bash

TITLE_APP="Calamo Importer"

function login_mysql()
{
    local user=$1
    local password=$2

    mysql -u $user -p$password -e "SHOW DATABASES"
}

credentials=`zenity --password --title="$TITLE_APP" --text="Introduce tu contraseña" --username`

case $? in 
        0)
            IFS="|" read -r -a data <<< "$credentials"
            user="${data[0]}"
            password="${data[1]}"
            login_mysql $user $password
            ;;
            
        1)
            echo -e "Credenciales incorrectas";;
        -1)
            echo -e "Ha ocurrido un error inesperado";;
esac