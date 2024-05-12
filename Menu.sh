#!/bin/bash

clear
while true

do


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

        1)
            clear 
            source 1-calendario.sh ;;

        2) 
            clear
            source 2-archivos.sh ;;

        3) 
            clear
            source 3-login.sh ;;

        4) 
            clear
            source 4-lista_contacto.sh ;;

        5) 
            clear
            source 5-tipo_archivo.sh ;;

        6) echo "Hasta Luego!"; exit 0 ;;

        *) 
            clear
            echo "Opcion invalida. Intente de nuevo." ;;

    esac

done
