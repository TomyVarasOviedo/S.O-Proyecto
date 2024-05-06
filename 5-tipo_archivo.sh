#!/usr/bin/env bash
read -p "Ingrese el texto o nombre del archivo: " nom_file

cambiar_permisos(){
  #Funcion para cambiar permisos de un archivo
  #$1: permisos que tiene el archivo
  #$2: nombre del archivo
  if [[ "$1" == *"$(whoami)"* ]]; then #Verifica si el usuario es dueño del archivo
    echo "Que permisos quieres agregar: 
          1.Permisos de escritura
          2.Permisos de lectura
          3.Permisos de ejecucion
          4.Permisos de eliminacion"
    while true
    do
      read opcion
      case $opcion in
        1)
          $(chmod u+w $2) #Otorga permisos de escritura
          echo "Al archivo $2 se le otorgaron permisos de escritura"
        ;;
        2)
          $(chmod u+r $2) #Otorga permisos de lectura
          echo "Al archivo $2 se le otorgaron permisos de lectura"
        ;;
        3)
          $(chmod u+x $2) #Otorga permisos de ejecucion
          echo "Al archivo $2 se le otorgaron permisos de ejecución"
        ;;
        4)
          $(chmod u+w $2) #Otorga permisos de escritura para poder eliminar
          echo "Al archivo $2 se le otorgaron permisos de eliminación"
        ;;
        5)
          break
          exit
        ;;
      esac
      echo "Que permisos quieres agregar: 
            1.Permisos de escritura
            2.Permisos de lectura
            3.Permisos de ejecucion
            4.Permisos de eliminacion
            5.Salir"
    done
  else
    echo "No existe el archivo o no tiene permisos para modificarlo"
  fi
}

if [[ -d $nom_file && -e $nom_file ]]; then #Verifica si el texto ingresado es un direcotorio o un archivo
  echo "El archivo ingresado es un direcctorio"
elif [[ -e $nom_file ]]; then
  nombre="${nom_file##*/}" #Expresio regular que recorta la extension del archivo
  echo "El nombre del archivo es: ${nombre%.*} y tiene la extension ${nombre##*.}"
  read -p "Desea ver los permisos que tiene este archivo[S/N]: " opcion
  if [[ "$opcion" == "S" || "$opcion" == "s" ]]; then
    permisos=$(ls -l "$nom_file" | egrep -o "^[^[:space:]]+") #grep: Funcion para buscar dentro de un archivo
    echo $permisos
    echo "Este archivo tiene permisos de:  "
    #Comprueba si tiene permisos de lectura
    if [[ $permisos == *"r"* ]]; then
      echo "- Lectura"
    fi
    #Comprueba si tiene permisos de ejecucion
    if [[ $permisos == *"x"* ]]; then
      echo "- Ejecucion"
    fi
    #Comprueba si tiene permisos de escritura
    if [[ $permisos == *"w"* ]]; then
      echo "- Escritura"
    fi
    cambiar_permisos "$(ls -l $nom_file)" $nom_file
  fi
else
  echo "No se reconoce al archivo $nom_file"
  echo "Por lo tanto se asume que quisiste decir: $nom_file"
fi
