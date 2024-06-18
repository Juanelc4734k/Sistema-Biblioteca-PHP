<!DOCTYPE html>
<html lang="es">
<head>
	<meta charset="UTF-8">
	<meta name="viewport" content="width=device-width, user-scalable=no, initial-scale=1.0, maximum-scale=1.0, minimum-scale=1.0">
	<title>Script php backup and restore</title>
</head>
<body>
	<?php
		include './Connet.php';//conexion base de datos
	?>
	<a href="./Backup.php">Realizar copia de seguridad</a>
	<form action="./Restore.php" method="POST">
		<label>Selecciona un punto de restauración</label><br>
		<select name="restorePoint">
			<option value="" disabled="" selected="">Selecciona un punto de restauración</option>
			<?php
				// Se define la ruta del directorio de copias de seguridad almacenada en la constante BACKUP_PATH.
				$ruta=BACKUP_PATH;

				// Se verifica si la ruta es un directorio válido.
				if(is_dir($ruta)){
					// Se intenta abrir el directorio y se guarda el puntero en la variable $aux.
				    if($aux=opendir($ruta)){
						// Se recorre el contenido del directorio.
				        while(($archivo = readdir($aux)) !== false){
							// Se excluyen los directorios "." y "..".
				            if($archivo!="."&&$archivo!=".."){
								// Se quita la extensión ".sql" del nombre del archivo.
				                $nombrearchivo=str_replace(".sql", "", $archivo);
								// Se reemplazan los guiones "-" por dos puntos ":" en el nombre del archivo.
				                $nombrearchivo=str_replace("-", ":", $nombrearchivo);
				                $ruta_completa=$ruta.$archivo;// Se construye la ruta completa del archivo.

								// Se verifica si la ruta completa corresponde a un directorio.
				                if(is_dir($ruta_completa)){
									// Si la ruta es un directorio, no se hace nada y se pasa a la siguiente iteración del bucle.
				                }else{
									// Si la ruta no es un directorio, 
									//se imprime una opción en el menú desplegable con la ruta completa como valor y 
									//el nombre del archivo como texto visible.
				                    echo '<option value="'.$ruta_completa.'">'.$nombrearchivo.'</option>';
				                }
				            }
				        }
				        closedir($aux);// Se cierra el directorio después de recorrerlo.
				    }
				}else{
				    echo $ruta." No es ruta válida";// Si la ruta no es válida, se muestra un mensaje de error.
				}
			?>
		</select>
		<button type="submit" >Restaurar</button>
	</form>
</body>
</html>