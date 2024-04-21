
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
# Function to create a directory
create_dir() {
  if [ -d $1 ]; then
    echo "Directory $1 already exists."
  else
    mkdir $1
    if [ $? -eq 0 ]; then
      echo "Directory $1 created successfully."
    else
      echo "Failed to create directory $1."
    fi
  fi
}
# Function to list all directories in the current directory
list_dirs() {
  echo "Listing all directories in the current directory:"
  for dir in $(ls); do
    echo ${dir%/}
  done
}

# Function to list all directories and files in the current directory
list_all() {
  echo "Listing all directories and files in the current directory:"
  ls -lR
}


# Function to delete a directory
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
