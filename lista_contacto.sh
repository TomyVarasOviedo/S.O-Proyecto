#!/bin/bash
#              _____  _______ 
#       /\    |  __ \|__   __|
#      /  \   | |  | |  | |   
#     / /\ \  | |  | |  | |   
#    / ____ \ | |__| |  | |   
#   /_/    \_\|_____/   |_|   
#                             
echo "
             
                             █████████████                          
                          ██████████████████                        
                         █████████████████████                      
                        ███████████████████████                     
                       ████████████████████████                     
                       █████████████████████████                    
                       █████████████████████████                    
                      ████   █████      ████████                    
                       ██ ███ ████  ███  ███████                    
                       ██ ███ ██████████ ███████                    
                       ██████░█░░█░████  ███████                    
                       ████░░░░░░░░░░░░█████████                    
                       ███░░░░░░░░░░░░██░███████                    
                      ███░██░░░░░░░░██░░░████████                   
                      █████░░█████░░░░███████████                   
                     █████████░░░░██████░██████████                 
                    ███████░████████░░░░░███████████                
                   ███████░░░░░░░░░░░░░░░░███████████               
                  ████████░░░░░░░░░░░░░░░░░████████████             
                █████████░░░░░░░░░░░░░░░░░░░████████████            
               █████████░░░░░░░░░░░░░░░░░░░░█████████████           
              ██████████░░░░░░░░░░░░░░░░░░░░░██████████████         
             ██████████░░░░░░░░░░░░░░░░░░░░░░░██████████████        
            ██████████░░░░░░░░░░░░░░░░░░░░░░░░░██████████████       
           ██████████░░░░░░░░░░░░░░░░░░░░░░░░░░██████████████       
          ███████████░░░░░░░░░░░░░░░░░░░░░░░░░░░██████████████      
          ██████████░░░░░░░░░░░░░░░░░░░░░░░░░░░░░█████████████      
         ███████████░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░█████████████     
         ██████████░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░██████████████     
         ██████████░░░░░░░░░░░░░░░░░░░░░░░░░░░░████████████████     
         ██████████░░░░░░░░░░░░░░░░░░░░░░░░░░█████████████████      
        ███░░█████████░░░░░░░░░░░░░░░░░░░░░░███████████████████     
      ███░░░░░░█████████░░░░░░░░░░░░░░░░░░░░████░█████████░░░███    
  ██████░░░░░░░░██████████░░░░░░░░░░░░░░░░░░████░░░█████░░░░░░███   
████░░░░░░░░░░░░░██████████░░░░░░░░░░░░░░░░████░░░░░░░░░░░░░░░░██   
███░░░░░░░░░░░░░░░██████████░░░░░░░░░░░░░░░████░░░░░░░░░░░░░░░░███  
███░░░░░░░░░░░░░░░░█████████░░░░░░░░░░░░░░░████░░░░░░░░░░░░░░░░░████
███░░░░░░░░░░░░░░░░░░██████░░░░░░░░░░░░░░░█████░░░░░░░░░░░░░░░░░░░██
███░░░░░░░░░░░░░░░░░░░██████░░░░░░░░░░░░██████░░░░░░░░░░░░░░░░░░░███
██░░░░░░░░░░░░░░░░░░░░░███████████████████████░░░░░░░░░░░░░░░░█████ 
██░░░░░░░░░░░░░░░░░░░░░░█████████████████████░░░░░░░░░░░░░░█████    
███████░░░░░░░░░░░░░░░░░░████████████████████░░░░░░░░░░░░███        
   ███████████░░░░░░░░░░███████       ███████░░░░░░░░░░███          
             █████████████                 ████░░░░░████            
                ███████                      █████████              
                               _____  _______ 
                         /\    |  __ \|__   __|
                        /  \   | |  | |  | |   
                       / /\ \  | |  | |  | |   
                      / ____ \ | |__| |  | |   
                     /_/    \_\|_____/   |_|   
                             
"                             

#importar las funciones

#se definen las variables
declare -A agenda

#funcion para poder mostrar el menu
menu_opcion(){
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
            declare -a array=([0]="$telefono" [1]="$mail")
            agenda[$nombre]=${array[*]}

            echo "CONTACTO: SE HA AÑADIDO CORRECTAMENTE."
        ;;

        2)
        #funcion para buscar contacto
            echo "BUSCAR CONTACTO: "
            echo "NOMBRE: "
            read nombre

            if [[ "${agenda[$nombre]}" != "" ]]; then
                echo "NOMBRE: $nombre"
                for array in ${telemail[@]}; #Muestra los datos de la agenda con ese nombre
                    do
                        echo "->$array"
                    done
                 echo "<------------------------->"
            else
                echo "CONTACTO $nombre NO ENCONTRADO"
            fi
        ;;

        3)
        #funcion para editar algun contacto
            echo "EDITAR CONTACTO:"
            echo "NOMBRE: "  
            read nombre  
            if [[ -n "${agenda[$nombre]}" ]]; then telefono=${agenda[$nombre][0]} mail=${agenda[$nombre][1]}  
            echo "NOMBRE: $nombre"
            echo "TELEFONO: $telefono"
            echo "MAIL: $mail"
            echo ""
            echo "¿QUE QUISIERA EDITAR?"
            echo "1. TELEFONO"
            echo "2. MAIL"
            echo ""
            echo "INGRESE LA OPCION QUE DESEA: "
            read opcioneditar
            case $opcioneditar in
                1)
                    echo "NUEVO NUMERO DE TELEFONO: "
                    read nuevotelefono
                    agenda[$nombre][0]=$nuevotelefono
                    echo "TELEFONO ACTUALIZADO CORRECTAMENTE." ;;
                2)
                    echo "NUEVO MAIL: "
                    read nuevomail
                    agenda[$nombre][1]=$nuevomail
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

            if [[ -n "${agenda[$nombre]}" ]]; then
                unset agenda[$nombre]
                echo "CONTACTO $nombre ELIMINADO CORRECTAMENTE."
            else
                echo "CONTACTO $nombre NO ENCONTRADO."
            fi;;

        5)
        #funcion para mostrar toda la lista de contactos
            echo "LISTA DE CONTACTOS:"
            if [[ -z "${agenda[@]}" ]]; then
                echo "NO HAY NINGUNA AGENDA DE CONTACTOS."
            else
                for nombre in "${!agenda[@]}"; 
                do
                    echo "NOMBRE: $nombre"
                    telemail=${agenda[$nombre]}
                    for array in ${telemail[@]}; #Muestra los datos de la agenda con ese nombre
                    do
                        echo "->$array"
                    done
                    echo "<------------------------->"
                done
            fi
        ;;

        6)
        break
        exit;;
    esac
    if [[$opcion -eq  6]]; then
        break
    fi
    menu_opcion
done
