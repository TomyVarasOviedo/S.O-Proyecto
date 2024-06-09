#!/bin/bash

#En esta funcion nos va a mostrar el filesystem de un usuario en especifico
show_filesystem() {
	local user_home=$(getent passwd "$1" | cut -d: -f6)
	if [ -d "$user_home" ]; then
		echo "Este es el espacio disponible en el directorio home de $1: "
		df -h --output=avail "$user_home" | tail -n 1
	else
		echo "El directorio home para el usuario $1 no existe :("
	fi
}

#En este caso, parecido al anterior, es de todos los usuarios
show_all_filesystems() {
	echo "Este es el espacio disponible en los directorios home de todos los usuarios:"
	awk -F: '$6 != "" {print $6}' /etc/passwd | while read -r home; do
		if [ -d "$home" ]; then
			filesystem=$(df -h --output=avail "$home" | tail -n 1)
			echo "$home: $filesystem"
		fi
	done
}

#Opciones
show_menu() {
	clear
	echo ""
	echo "HOLIII!!!"
	echo "Seleccione una opcion:"
	echo "1. Quiero ver el filesystem de un usuario especifico"
	echo "2. Mostrame el filesystem de todos los usuarios"
	echo "3. Me quiero vayar!!!"
	echo ""
	read -p "Ingresa una opcion: " option
}

#Manejar el menu
while true; do
	show_menu
	case $option in
	1)
		read -p "Pofi, ingresa el nombre de usuario: " username
		echo "El nombre del usuario que eligiste es: $username"
		show_filesystem "$username"
		;;
	2)
		show_all_filesystems
		;;
	3)
		echo "Hasta la proxima..."
		break
		exit 0
		;;
	*)
		echo "Opcion invalida, intentalo de nuevo."
		;;
	esac
	read -p "SI QUERES CONTINUAR (OBVIO QUE QUERES) PRESIONA ENTER..."
done

