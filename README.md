# Tema: Programación de Scripts

> ## Normas comunes de trabajo
> 1. Se desarrollará bajo shellbash, y cada archivo (scrip o guión) debera seguir la siguiente nomenclatura en su asignación de nombre: <nombrearchivo>.bash. Cualquier otra forma de nombre de archivo será automáticamente descalificante para el archivo.
> 2. La confección de archivos fuentes debe estar bien documentada, y a lo largo del código debe tener los comentarios correspondientes. Ello facilitaría el trabajo del grupo coordinador.
> 3. Cada guión debe realizar un control de opciones, si son necesarias; para el caso de utilizar alguna herramienta, comando u orden del SOp debe permitir en dicho caso el uso de las opciones indicando sobre el uso de las mismas.
> 4. Todos los guiones, incluyendo el guión final, deben tener una opción -v que permita indicar el número de versión.
> 5. Todo guión que solicite datos de entrada debe verificar validez y consistencia de los datos, indicando errores en cada caso. Debe ser lo más amigable posible.
> 6. Nomenclatura común propuesta, es opciónal, pero cualquier otra debe claramente reglamentada.
> - uid : Número de usuario de Linux.
> - nom-usr : Nombre de usuario en Linux.
> - data-usr : Campo de descripción del usuario existente en el archivo /etc/passwd.
> - gid : Número de grupo de Linux.
> - pid : Número de proceso en Linux.
> - ps-pro : Referencia a la descripción del proceso informada por el comando ps.
> - dir-path : Referencia al path del directorio.
> - shell : Referencia al loginshell del usr.
> - home : Directorio por defecto del usuario.
> - t-file : Tipo de Archivo.
> - d-file : Descripción de t-file.
> - nom-file : Nombre del archivo, sin path.
> ## Notas:
>   Ningún dato de los campos alfanuméricos puede exceder los 80 caracteres en pantalla, si excediesen dicho valor, deberán ser truncados para que no superen esa longitud. Sólo está permitido el uso de herramientas provistas por el SOp Unix. En el caso de que dicha herramienta no exista o no se adapte a las necesidades, el grupo puede desarrollar alguna solución alternativa, pero no se recomienda por cuestiones de tiempo. Recordar que debe existir una manera similar de presentación de los datos en pantalla. Idem para el sistema de menús y submenús. Todos los Scrips deben poder ser ejecutados en forma batch o interactiva. Se recomienda el uso de comentarios, para dar mayor legibilidad a los guiones. Desarrollo del Software

> > 1. Guión que permita visualizar el calendario del mes, el día y hora, en el momento que se realice la consulta.
> > 2. Guión que me permita crear, listar (de distintas formas) borrar directorios.
> > 3. Guión que informe sobre que usuarios están sesionados en un determinado tiempo. Debe ordenarse por nombre de usr. Presentando como mínimo los datos de nombre de usr, uid, desc-usr, la tty, pid y p-desc.
> > 4. Guión que permita tener una agenda telefónica, allí deberá guardarse los datos de los conocidos y de los usuarios que pertenecen al sistema. Debe permitir la introducción de datos.
> > 5. Guión que permita determinar si e string es un archivo (tipo), directorio, o es otra cosa. Contemplar la opción de que par el caso de que sea un texto o similar visualizarlo por pantalla. Y si deseo poder modificar los permisos de dicho archivo (cuando sea el dueño).
> > 6. Guión de utilidades para correr directamente los comandos : who, ps, df, du, grep, lp, ls, cat.
> > 7. Guión que permita, que ante la introducción del nombre del usr me diga sus datos de usuario y los procesos asociados con él, así como la tty correspondiente. Cuando el usr no esté sesionando deberá indicar dicho estado, pero al menos debe dar los datos del mismo. Contemplar una opción que permita dar los valores de todos los usuario sesionados.
> > 8. Guión que informe sobre que filesystem se encuentra el home de un usr. Que haya una opción para indicar cual es el filesystem de todos los usuarios.
> > 9. Guión que indique que espacio es utilizado por el home de un determinado usr, en KB. Cuando el usr no exista debe informar el error y repetir solicitud del dato. Debe haber una opción que permita hacerlo para todos los usuarios del sistema. Contemplar la opción de que salga en Mbytes.
> > 10. Guión que permita la impresión hacia distintas impresoras conectadas a la red, con previa asignación por tty (opcional). Debe sólo pedir archivos a imprimir y si ha hecho uso de la opción también desde que tty desea hacerlo (opcional, que sea transparente).
> Guión que permita realizar resguardo, visualización y recuperación de los datos que indique el usr. Contemplar las distintas maneras de hacerlo, indicándolo a través de opciones y dando una explicación sintética de las diferencias de uno u otro. El uso de los comandos de backup debe ser transparente al usr. Herramientas
> Utilizarán los apuntes de la materia y material que se encuentra en el sitio de materia. Producto funcional 
> Es necesaria para la aprobación del Proyecto que el Software funcione. Y que se encuentren en el escrito final, los fuentes y las impresiones de pantalla correspondiente.
> ## 6. Documentación a entregar
> Deberá entregarse al final de Proyecto lo siguiente:
> - a. Software funcionando.
> - b. Informe donde se describa todo el desarrollo del proyecto y las decisiones tomadas.
> - c. Documentación de la Instalación y configuración.
> - d. Manual de usuario.

> ## 7. Fecha de entrega
> 	Martes, semana 16.
> _Nota: En el informe realizado al respecto deberán constar las fuentes literarias y de Internet (fecha – hora de ingreso), así como toda Bibliografía utilizada._
