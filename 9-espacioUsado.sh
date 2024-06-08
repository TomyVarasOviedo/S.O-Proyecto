#!/bin/bash

# Función para calcular el espacio utilizado por el home de un usuario
get_home_space() {
    local user=$1
    local unit=$2

    if id -u "$user" >/dev/null 2>&1; then
        local home_dir=$(eval echo ~"$user")
        local space_used=$(du -s "$home_dir" | awk '{print $1}')

        if [ "$unit" = "KB" ]; then
            echo "El espacio utilizado por el home de $user es: $space_used KB"
        elif [ "$unit" = "MB" ]; then
            echo "El espacio utilizado por el home de $user es: $(printf "%.2f" $(($space_used / 1024))) MB"
        else
            echo "Unidad no válida. Utilice KB o MB."
        fi
    else
        echo "El usuario $user no existe."
    fi
}

while true; do
    echo "Seleccione una opción:"
    echo "1. Buscar espacio de un usuario específico"
    echo "2. Buscar espacio de todos los usuarios del sistema"
    echo "3. Salir"

    read option

    case $option in
        1)
            echo "Ingrese el nombre de usuario:"
            read user
            echo "Ingrese la unidad (KB o MB):"
            read unit
            get_home_space "$user" "$unit"
            ;;
        2)
            echo "Seleccione la unidad de medida:"
            echo "1. KB"
            echo "2. MB"
            read unidad

            for user in $(getent passwd | cut -d: -f1); do
                home_dir=$(eval echo ~$user)
                if [ -d "$home_dir" ]; then
                    if du -c -s "$home_dir" &> /dev/null; then
                        space_used=$(du -s "$home_dir" | awk '{print $1}')
                        if [ "$space_used" -gt 0 ]; then
                            if [ "$unidad" = "1" ]; then
                                echo "El usuario $user utiliza $space_used KB en su home"
                            elif [ "$unidad" = "2" ]; then
                                echo "El usuario $user utiliza $(printf "%.2f" $(($space_used / 1024))) MB en su home"
                            fi
                        fi
                    fi
                fi
            done
            ;;
        3)
            echo "Saliendo..."
            exit 0
            ;;
        *)
            echo "Opción no válida. Intente nuevamente."
            ;;
    esac
done
