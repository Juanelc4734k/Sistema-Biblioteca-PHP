<?php
include 'Connet.php';//Incluye la conexion a la Base de datos.

//Se recupera el punto de restauracion enviado por el metodo "POST".
$restorePoint=$_POST['restorePoint'];

// Se lee el contenido de la variable de "$restorePoint".
// y se divide en array de consultas utilizando el caracter ";" como delimitador.
$sql=explode(";",file_get_contents($restorePoint));

$totalErrors=0;// Variable para contar el número total de errores durante la restauración de la base de datos.

// Se inicia un bucle 'for' para recorrer todas las consultas almacenadas en el array '$sql'.
for($i = 0; $i < (count($sql)-1); $i++){
    // Se intenta ejecutar la consulta SQL utilizando el método 'sql' de la clase 'SGBD'.
    // Si la consulta se ejecuta correctamente, no se realiza ninguna acción adicional.
    // Si la consulta falla (retorna false), se incrementa la variable '$totalErrors' en 1.
    if(SGBD::sql("$sql[$i];")){  }else{ $totalErrors++; }
}

// Se verifica si hubo algún error durante la ejecución de las consultas.
if($totalErrors<=0){
    // Si no hubo errores, se muestra una alerta informando que la restauración se realizó con éxito.
    // Y se redirecciona a la página 'copiaSeguridad.php'.
	echo '<script> alert("Restauracion de la Base de Datos Realizada con Exito.");</script>';
    echo '<script> window.location="../copiaSeguridad.php"; </script>';
}else{
    // Si hubo errores, se muestra una alerta informando que no se pudo realizar la restauración.
    // Y se redirecciona a la página 'copiaSeguridad.php'.
	echo '<script> alert("No se ha podido realizar la restauracion de la Base de Datos.");</script>';
    echo '<script> window.location="../copiaSeguridad.php"; </script>';
}