
# ------------------------------------
#              _____  _______ 
#       /\    |  __ \|__   __|
#      /  \   | |  | |  | |   
#     / /\ \  | |  | |  | |   
#    / ____ \ | |__| |  | |   
#   /_/    \_\|_____/   |_|   
#                             
# ------------------------------------

while test $# -gt 0; do
	case "$1" in 
		-h| --help)
			echo "-c Crear archivo"
			echo "-d Eliminar archivo"
			exit 0
			;;
		-c)
			read -p "Ingresar nombre del directorio: " nombreArchivo
			mkdir $nombreArchivo
			exit 1
			;;
		-d)
			read -p "Ingresar nombre del directorio: " nombreArchivo
			rm -r $nombreArchivo
			exit 1
			;;
		*)
			break
			;;
	esac
done
