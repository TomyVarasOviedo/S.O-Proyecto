#!/bin/bash

# Funcion que chequea si el usuario esta logueado
is_logged_in() {
    if who | grep -q "$1"; then
        return 0
    else
        return 1
    fi
}

# Pide el nombre de usuario
echo "Ingrese el nombre de usuario:"
read usuario

# Verifica si existe
if id -u "$usuario" >/dev/null 2>&1; then
    # El usuario si existe asi que se busca su info y procesos
    info=$(id -a "$usuario")
    procesos=$(ps -u "$usuario" --no-headers | tail -n 10)

    # Ahora mira si esta logueado
    if is_logged_in "$usuario"; then
        # Esta logueado
		tty=$(who | grep "$usuario" | awk '{print $2}')
        echo "Informacion del usuario '$usuario':"
        echo "$info"
        echo "Estos son los ultimos 10 procesos utilizados por $usuario:"
        echo "PID   PPID  CPU  MEM  COMMAND"
        echo "$procesos" | column -t
		echo "Terminal actual: $tty"
    else
        # Como no esta logueado se imprime una info basica
        echo "Informacion del usuario: $user_name"
        echo "Nombre de usuario: $usuario"
        echo "UID: $(id -u "$usuario")"
        echo "GID: $(id -g "$usuario")"
        echo "Directorio Home: $(eval echo ~"$usuario")"
        echo "Shell: $(grep "^$usuario:" /etc/passwd | cut -d: -f7)"
    fi
else
    # No existe
    echo "El usuario no existe."
fi
