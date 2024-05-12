#!/bin/bash


while true

do

    clear

    echo "Menu:"

    echo "1. Visualice el dia, hora y mes a la que se realiza esta consulta."

    echo "2. Crear, listar o borrar directorios."

    echo "3. Descubrir que usuarios iniciaron sesion en un determinado tiempo."

    echo "4. Utilizar una agenda telefonica"

    echo "5. Descubrir que tipo de archivo es un string que sea ingresado."

    echo "6. Salir"


    read -p "Seleccione su opcion: " opcion

	#Dependiendo de la opcion ingresada se examina un caso.
    case $opcion in

        1) ./Funcion1.sh ;;

        2) ./Funcion2.sh ;;

        3) ./Funcion3.sh ;;

        4) ./Funcion4.sh ;;

        5) ./Funcion5.sh ;;

        6) echo "Hasta Luego!"; exit 0 ;;

        *) echo "Opcion invalida. Intente de nuevo." ;;

    esac

done
