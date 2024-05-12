#!/bin/bash
#              _____  _______ 
#       /\    |  __ \|__   __|
#      /  \   | |  | |  | |   
#     / /\ \  | |  | |  | |   
#    / ____ \ | |__| |  | |   
#   /_/    \_\|_____/   |_|   
#                             

#funcion para poder mostrar el menu
menu_opcion(){
    echo ""
    echo "MENU DE LA AGENDA TELEFONICA"
    echo "1.AÑADIR UN CONTACTO"
    echo "2.BUSCAR UN CONTACTO"
    echo "3.EDITAR ALGUN CONTACTO"
    echo "4.ELIMINAR ALGUN CONTACTO"
    echo "5.MOSTRAR TODOS SUS CONTACTOS"
    echo "6.SALIR"
    echo ""
    echo "INGRESE LA OPCION QUE DESEA EJECUTAR"
    read opcion
}
menu_opcion
while true
    do
    case $opcion in

        1)
        #funcion para poder agregar algun contacto
            echo "AÑADIR CONTACTO"
            read -p "NOMBRE: " nombre
            read -p "TELEFONO: " telefono
            read -p "MAIL: " mail
            nombre_guardar=$(sed 's/ /-/g' <<< "$nombre") #Expresion regular para reemplazar los espacios por guiones
            echo "$nombre_guardar,$telefono,$mail" >> contactos.txt #Añade el contacto al archivo donde estan los contactos
            echo "CONTACTO: SE HA AÑADIDO CORRECTAMENTE."
        ;;

        2)
        #funcion para buscar contacto
            echo "BUSCAR CONTACTO: "
            echo "NOMBRE: "
            read nombre
            nombre_buscar=$(sed 's/ /-/g' <<< "$nombre") #Modifica el texto atraves de una expresion regular para quitarle los espacios y reemplazarlos por guiones
            readarray -d "," -t datos <<< $(grep "$nombre_buscar" contactos.txt ) #Almacena en un array el telefono y el mail del archivo txt
            if ! [[ "${#datos[@]}" == "1" ]]; then #Comprueba si no esta vacio el array
                echo "NOMBRE: $nombre"
                echo "TELEFONO: ${datos[1]}"
                echo "MAIL: ${datos[2]}"
            else
                echo "CONTACTO $nombre NO ENCONTRADO"
            fi
        ;;

        3)
        #funcion para editar algun contacto
            echo "EDITAR CONTACTO:"
            echo "NOMBRE: "  
            read nombre
            nombre_buscar=$(sed 's/ /-/g' <<< "$nombre")
            readarray -d "," -t datos <<< $(grep "$nombre_buscar" contactos.txt )
            if ! [ "${#datos[@]}" == "1" ]; then
                telefono=${datos[1]}
                mail=${datos[2]}
                echo "NOMBRE: $nombre"
                echo "TELEFONO: $telefono"
                echo "MAIL: $mail"
                echo "¿QUE QUISIERA EDITAR?"
                echo "1. TELEFONO"
                echo "2. MAIL"
                echo ""
                echo "INGRESE LA OPCION QUE DESEA: "
                read opcioneditar
                sed -i "/$nombre_buscar/d" contactos.txt #Utiliza una expresion regular para eliminar la linea donde se encuentra el nombre del contacto
                case $opcioneditar in
                    1)
                        echo "NUEVO NUMERO DE TELEFONO: "
                        read nuevotelefono
                        echo "$nombre_buscar,$nuevotelefono,$mail" >> contactos.txt
                        echo "TELEFONO ACTUALIZADO CORRECTAMENTE." ;;
                    2)
                        echo "NUEVO MAIL: "
                        read nuevomail
                        echo "$nombre_buscar,$telefono,$nuevomail" >> contactos.txt
                        echo "MAIL ACTUALIZADO CORRECTAMENTE." ;;
                    *)
                        echo "OPCION INVALIDA." ;;
                esac
            else
                echo "CONTACTO $nombre NO ENCONTRADO."
            fi
        ;;

        4)
        #funcion para poder eliminar a tu ex de contactos
            echo "ELIMINAR CONTACTO:"
            echo "NOMBRE: "
            read nombre
            nombre_buscar=$(sed 's/ /-/g' <<< "$nombre")
            readarray -d "," datos <<< $(grep "$nombre_buscar" contactos.txt)
            if ! [ "${#datos[@]}" == "1" ]; then
                sed -i "/$nombre_buscar/d" contactos.txt 
                echo "CONTACTO $nombre ELIMINADO CORRECTAMENTE."
            else
                echo "CONTACTO $nombre NO ENCONTRADO."
            fi;;

        5)
        #funcion para mostrar toda la lista de contactos
            echo "LISTA DE CONTACTOS:"
            lista=$(cat contactos.txt)
            if [[ -z "$lista" ]]; then #Comprueba si la agenda no tiene contactos
                echo "NO HAY NINGUNA AGENDA DE CONTACTOS."
            else
                echo "<----------------------->"
                for contacto in $lista
                do
                    readarray -d "," -t dato <<< $contacto #Guarda en un array los datos de los contactos almacenados
                    nombre_buscar=$(sed 's/-/ /g' <<< ${dato[0]}) #Expresion regular que hace lo inverso a lo anterior
                    echo "NOMBRE: $nombre_buscar"
                    echo "TELEFONO: ${dato[1]}"
                    echo "MAIL: ${dato[2]}"
                    echo "<----------------------->"
                done
            fi
        ;;

        6)
        break
        exit;;
    esac
    menu_opcion
done
