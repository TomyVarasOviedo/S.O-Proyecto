# ------------------------------------
#              _____  _______
#       /\    |  __ \|__   __|
#      /  \   | |  | |  | |
#     / /\ \  | |  | |  | |
#    / ____ \ | |__| |  | |
#   /_/    \_\|_____/   |_|
#
# ------------------------------------

#----------------#
#----Funciones---#
#----------------#
# Crear el directorio
create_dir() {
	if [ -d $1 ]; then
		echo "El directorio $1 ya existe."
	else
		mkdir $1
		# Se usa el comando $? para verificar si se pudo crear el directorio con mkdir
		if [ $? -eq 0 ]; then
			echo "Se ha creado el directorio: $1."
		else
			echo "No se pudo crear el directorio: $1."
		fi
	fi
}
# Listar todos los directorios que se encuentran en el directorio actual
list_dirs() {
	echo "Listando todos los directorios que se encuentran en el directorio actual:"
	for dir in $(ls); do
		echo ${dir%/}
	done
}

# Listar todos los directorios y archivos del directorio actual
list_all() {
	echo "Listando todos los directorios y archivos del directorio actual:"
	ls -lR
}

# Eliminar un directorio
delete_dir() {
	if [ -d $1 ]; then
		if [ "$(ls -A $1)" ]; then
			echo "El Directorio $1 no esta vacio."
		else
			rm -r $1
			if [ $? -eq 0 ]; then
				echo "El directorio $1 ha sido eliminado satisfactoriamente."
			else
				echo "No se pudo eliminar el directorio $1."
			fi
		fi
	else
		echo "El directorio $1 no existe."
	fi
}

#----------------#
#----Funciones---#
#----------------#

while test $# -gt 0; do
	case "$1" in
	-h | --help)
		echo "-c Crear directorio"
		echo "-d Eliminar directorio"
		echo "-l Listar directorio actual"
		echo "-b Listar todo lo que contenga el directorio actual"
		break
		;;
	-c)
		create_dir "$2"
		break
		;;
	-d)
		delete_dir "$2"
		break
		;;
	-l)
		list_dirs
		break
		;;
	-b)
		list_all
		break
		;;
	*)
		break
		;;
	esac
done
