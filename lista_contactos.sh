#!/bin/bash
declare -A agenda
#Funciones
agregar_agenda(){
  #$1: Nombre
  #$2: Telefono
  #$3: Mail
  declare -a array=([0]="$2" [1]="$3")
  echo "${agenda["$1"]}"
  if [ -n "${agenda["$1"]}" ]; then
    agenda+=( ["$1"]=$array[*])
    return "Se ha insertado a $1 exitosamente"
    break
  else
    return "El usuario $1 ya existe en la agenda..."
    break
  fi
}
#Funciones
resultado=$(agregar_agenda "Toto" 12345 "tomas.varas@comunidad")
echo $resultado
