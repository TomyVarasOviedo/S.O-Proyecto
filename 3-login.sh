#!/bin/bash

#Aqui se ingresara la fecha de inicio.
echo "Ingrese la fecha de inicio usando el siguiente formato (AAAA-MM-DD): "
read inicio

#Verifica que la fecha de inicio sea valida inspeccionando cada caracter ingresado y que no sea una fecha mayor a la actual.
until [[ $inicio =~ ^[0-9]{4}-[0-9]{2}-[0-9]{2}$ ]] && [[ $(date -d "$inicio" +%s) -le $(date +%s) ]]; do
    if [[ ! $inicio =~ ^[0-9]{4}-[0-9]{2}-[0-9]{2}$ ]]; then
        echo "Formato invalido. Ingrese nuevamente una fecha de inicio usando el formato AAAA-MM-DD."
    else
        echo "La fecha de inicio debe ser anterior o igual a la del dia de hoy."
    fi
    read inicio
done

#Ingreso fecha final
echo "Ingrese la fecha final usando el siguiente formato (AAAA-MM-DD):"
read final

#Verifica que la fecha sea valida y que sea posterior a la fecha de inicio, pero que tambien sea anterior o igual a
#la fecha actual.
until [[ $final =~ ^[0-9]{4}-[0-9]{2}-[0-9]{2}$ ]] && [[ $(date -d "$final" +%s) -ge $(date -d "$inicio" +%s) ]] && [[ $(date -d "$final" +%s) -le $(date +%s) ]]; do
    if [[ ! $final =~ ^[0-9]{4}-[0-9]{2}-[0-9]{2}$ ]]; then
        echo "Formato invalido. Ingrese nuevamente una fecha final usando el formato AAAA-MM-DD."
    elif [[ $(date -d "$final" +%s) -lt $(date -d "$inicio" +%s) ]]; then
        echo "La fecha final debe ser despues de la fecha inicial."
    else
        echo "La fecha final debe ser anterior o igual a la fecha del dia de hoy."
    fi
    read final
done

# Se usara el comando last para conseguir la lista de usuarios que ingresan en ese margen de tiempo
echo "Usuarios que iniciaron sesion entre $inicio y $final:"
users=$(last --time-format iso --since "$inicio 00:00:00" --until "$final 23:59:59" | awk '{print $1}')

# Se chequea cada usuario y se imprimen los campos deseados.
for user in $users; do
    # Se chequea que el usuario exista usando el comando id.
    if id -u $user >/dev/null 2>&1; then
        # Se vuelve a usar el comando id para poder conseguir el id del usuario.
        id=$(id -u $user)
        uid=$(echo $id | awk '{print $1}')

        # Se utiliza el comando getent para buscar en passwd la descripcion del usuario
        usr_desc=$(getent passwd $user | awk -F: '{print $5}')

        #Sacar pid y tty.
		 
		pid=$(ps -u $user -o pid= | tail -n 1)
		p_desc=$(ps -u $pid -o comm)
		tty=$(who | grep $user | awk '{print $2}')

		# Se imprimen.
        echo "UID: $uid"
        echo "NOM-USR: $user"
        echo "USER-DESC: $usr_desc"
		echo "PID: $pid"	
		echo "P-DESC: $p_desc"
		echo "tty: $tty"
        echo ""
    fi
done
