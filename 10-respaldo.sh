#Funciones
imprimir_archivo() {
	local impresora=$1
	local archivo=$2

	lp -d $impresora $archivo

}
cola_impresion() {
	lpstat -a | awk '{print $1}'
}
#Funciones
echo "Bienvenido al menu de respaldo:
      1=>Impresion de un archivo
      2=>Respaldo de un dispositivo
      3=>Retaurar un archivo de respaldo
      4=>Mostrar el contenido de un archivo de respaldo"

read -p "Ingresa su opcion: " opcion
case "$opcion" in
1)
	read -p "Ingresar la ruta del archivo: " file
	lp -d brother-Hl $file
	echo "Imprimiendo...."
	;;
2)
	#Respaldo de un dispositivo
	read -r "Ingrese el dispositivo de donde va copiar los archivos (si el dispositivo es el mismo equipo ingrese "self"): " disp1 read -r "Ingrese el dispositivo de destino a donde se van a almacenar los datos: " destino
	if [[ disp1 = "self" ]]; then
		disp1="/dev/sda"
	fi
	dd if=disp1 of=destino bs=4M
	;;
3)
	#Restaurar archivo de respaldo
	read -r "Archivo de respaldo: " archivoRespaldo
	read -r "Dispositivo de destino(ingrese self si el destino es el mismo dispositivo)" destino
	if [[ destino = "self" ]]; then
		destino="/dev/sda"
	fi
	if [[ -f archivoRespaldo ]]; then
		dd if=archivoRespaldo of=destino bs=4M
	fi
	;;
4)
	read -r "Ingrese la ruta del archivo: " archivo
	strings $archivo | less
	;;
5)
	#Mostrar la cola de Impresion
	lpstat -a | awk '{print $1}'
	;;
*)
	exit
	;;
esac
