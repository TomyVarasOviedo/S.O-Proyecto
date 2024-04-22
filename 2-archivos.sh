
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
  echo "Listing all directories and files in the current directory:"
  ls -lR
}


# Eliminar un directorio
delete_dir() {
  if [ -d $1 ]; then
    if [ "$(ls -A $1)" ]; then
      echo "Directory $1 is not empty."
    else
      rm -r $1
      if [ $? -eq 0 ]; then
        echo "Directory $1 deleted successfully."
      else
        echo "Failed to delete directory $1."
      fi
    fi
  else
    echo "Directory $1 does not exist."
  fi
}
#----------------#
#----Funciones---#
#----------------#

while test $# -gt 0; do
	case "$1" in 
		-h| --help)
			echo "-c Crear directorio"
			echo "-d Eliminar directorio"
			echo "-l Listar directorio actual"
			exit 0
			;;
		-c)
			create_dir "$2"
			exit 1
      break
			;;
		-d)
      delete_dir "$2"
			exit 1
      break
			;;
		-l)
			list_dirs
			exit 1
      break
			;;
		*)
			break
			;;
	esac
done
