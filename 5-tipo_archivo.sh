#!/usr/bin/env bash
read -p "Ingrese el nombre del archivo: " nom_file

if [[ -d $nom_file && -e $nom_file ]]; then
  echo "El archivo ingresado es un direcctorio"
elif [[ -e $nom_file ]]; then
  nombre="${nom_file##*/}"
  echo "El nombre del archivo es: ${nombre%.*} y tiene la extension ${nombre##*.}"
else
  echo "No se reconoce al archivo $nom_file"
  continue
fi
read -p "Desea ver los permisos que tiene este archivo[S/N]: " opcion
if [ $opcion == "S" ]; then
  permisos=$(stat "$nom_file" | egrep -o '/-[^/]*--') #grep: Funcion para buscar dentro de un archivo
  echo "Permisos:  $permisos"
fi
