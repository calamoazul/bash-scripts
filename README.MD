# Scripts de BASH

En el siguiente repositorio muestro una serie de scripts de bash que me ayudan a automatizar tareas o a realizar prácticas de scripting.

Los scripts son los siguientes:

## calamo_mysql

Este script abre un diálogo con la librería Zenity, disponible entre otros para entornos de escritorio GNOME para Linux, y te pide las credenciales para entrar en el servidor mysql y trabajar en terminal.
Es un script sencillo de práctica para probar las utilidades de Zenity

## docs.sh

Este script básicamente me sirve para abrir documentación sin tener que buscarla en los favoritos del navegador. Lo uso sobre todo mientras estot programando y necesito consultar algún concepto,

# #projects

Este script lo empleo para abrir en Visual Studio Code los proyectos con los que estoy trabajando. En él empleo una variable de entorno para referirme al directorio específico de mi virtualhost.
Para definir una variable de entorno en LINUX, hay que ejecutar los siguientes comandos en la terminal:
´´´
bash 

DIR_PROJECTS='/directorio/proyectos'
EXPORT DIR_PROJECTS
´´´

Así se pueden usar las variables de entorno en los scripts de bash.