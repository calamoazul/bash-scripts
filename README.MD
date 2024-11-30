# Scripts de BASH

En el siguiente repositorio muestro una serie de scripts de bash que me ayudan a automatizar tareas o a realizar prácticas de scripting.

Los scripts son los siguientes:

## Calamo_mysql

Este script abre un diálogo con la librería Zenity, disponible entre otros para entornos de escritorio GNOME para Linux, y te pide las credenciales para entrar en el servidor mysql y trabajar en terminal.
Es un script sencillo de práctica para probar las utilidades de Zenity

## Docs

Este script básicamente me sirve para abrir documentación sin tener que buscarla en los favoritos del navegador. Lo uso sobre todo mientras estot programando y necesito consultar algún concepto,

## Projects

Este script lo empleo para abrir en Visual Studio Code los proyectos con los que estoy trabajando. En él empleo una variable de entorno para referirme al directorio específico de mi virtualhost.
Para definir una variable de entorno en LINUX, hay que ejecutar los siguientes comandos en la terminal:

```bash 
bash
DIR_PROJECTS='/directorio/proyectos'
EXPORT DIR_PROJECTS
```

Así se pueden usar las variables de entorno en los scripts de bash.

## Exporter

Este script es muy sencillo, pero sirve para mostrar cómo ejecutar un script a través de un script de bash. Y también cómo pasar argumentos con nombre en un script de bash.
La estructura es la siguiente:

```bash
bash
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
```

Al marcar con dos puntos el argumento, se le indica que hay que pasarle parámetros. Si no hay, no es necesario, como en el caso del argumento para mostrar el menu de ayuda

```bash
bash
exporter -h
```

Para crear el alias del script, solo hay que editar el archivo .bashrc y crear una función para dar formar al alias.
```bash
bash
function exporter()
{
    bash ./exporter.sh ${@}
}
```

El parámetro ${@} le indica que le pasemos todos los argumentos que reciba la función.

El script de php es muy sencillo. Es una objeto que toma los argumentos pasados por parámetros al script y genera un excel en la ruta solicitada.

```php
php

/**
 * @var string $url Primer argumento recibido del script
 */
$url = $argv[1];

/**
 * @var string $output Segundo argumento recibido del script
 */

$output = $argv[2];

/**
 * Ejecución del script
 */

$exporter = new Exporter($url, $output);
$exporter->export();
``` 

La ejecución final del script de bash sería así:

```bash
bash
exporter -u https://pokeapi.co/api/v2/pokemon/pikachu -o pikachu.xlsx
```

El script podría tener más validaciones. Por ejemplo, se podría filtrar que el argumento pasado por -o fuera siempre un archivo con extensión admitida por excel (csv, excel).