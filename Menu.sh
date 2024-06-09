#!/bin/bash

clear
echo "                                     
              ████████████████████████                     
            ████████████████████████████            
         ██████████████████████████████████         
      ████████████████████████████████████████      
   ██████████████████████████████████████████████   
  ███████████    ███████            ██████████████  
  ███████████     ██████              ████████████  
 ████████████     ██████     ████      ████████████ 
 ████████████     ██████    ██████     ████████████ 
█████████████     ██████    ██████     █████████████
█████████████     ██████              ██████████████
█████████████     ██████              ██████████████
█████████████     ██████    ██████     █████████████
 ████████████     █████     ██████      ███████████ 
 ████████████       █       █████      ████████████ 
  ████████████                        ████████████  
  ███████████████       █           ██████████████  
   ██████████████████████████████████████████████   
      ████████████████████████████████████████      
         ██████████████████████████████████         
               ██████████████████████               
                    ████████████                    

"
while true; do

	echo "
  Menu:"

	echo "1 => Visualice el dia, hora y mes a la que se realiza esta consulta."

	echo "2 => Crear, listar o borrar directorios."

	echo "3 => Descubrir que usuarios iniciaron sesion en un determinado tiempo."

	echo "4 => Utilizar una agenda telefonica"

	echo "5 => Descubrir que tipo de archivo es un string que sea ingresado."

	echo "6 => Ejecutar comandos who, ps, df, du, grep, lp, ls, cat."

	echo "7 => Datos y procesos asociados al usuario."

	echo "8 => Informacion sobre el filesystem del usuario actual."

	echo "9 => Espacio utilizado por el usuario actual."

	echo "10 => Imprimir y respaldar archivos."

	echo "11 => Salir"

	read -p "Seleccione su opcion: " opcion

	#Dependiendo de la opcion ingresada se examina un caso.
	case $opcion in

	1)
		clear
		source 1-calendario.sh
		;;

	2)
		clear
		source 2-archivos.sh -h
		read -p "Ingrese la accion que desea realizar: " opcion
		case "$opcion" in
		"-c")
			read -p "Ingrese el nombre del nuevo directorio: " name
			source 2-archivos.sh -c name
			;;
		"-d")
			read -p "Ingrese el nombre del directorio que desea borrar: " name
			source 2-archivos.sh -d name
			;;
		"-l")
			source 2-archivos.sh -l
			;;
		"-b")
			source 2-archivos.sh -b
			;;
		*)
			break
			exit 1
			;;
		esac

		;;

	3)
		clear
		source 3-login.sh
		;;

	4)
		clear
		source 4-lista_contacto.sh
		;;

	5)
		clear
		source 5-tipo_archivo.sh
		;;
	6)
		clear
		source 6-correrComandos
		;;
	7)
		clear
		source 7-infoUsuario.sh
		;;
	8)
		clear
		source 8-filesystem.sh
		;;
	9)
		clear
		source 9-espacioUsado.sh
		;;
	10)
		clear
		source 10-respaldo.sh
		;;
	11)
		echo "Hasta Luego!"
		exit 0
		;;
	*)
		clear
		echo "Opcion invalida. Intente de nuevo."
		;;

	esac

done
