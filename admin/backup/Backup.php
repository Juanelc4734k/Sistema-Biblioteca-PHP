<?php
include '../conexion.php';

// Se obtiene la fecha y hora actual.
$day=date("d");
$mont=date("m");
$year=date("Y");
$hora=date("H-i-s");
$fecha=$day.'_'.$mont.'_'.$year;

// Se definen constantes para el nombre de la base de datos y la ruta de la carpeta de copias de seguridad.
define("BD", "bibliotecauni");
define("BACKUP_PATH", "backup/");

// Se construye el nombre del archivo de copia de seguridad utilizando la fecha y hora actual.
$DataBASE="Backup_Biblioteca_".$fecha."_(".$hora."_hrs).sql";

// Se crea un array para almacenar los nombres de las tablas de la base de datos.
$tables=array();

// Se inicializa la variable de error.
$error=0;

// Se obtienen los nombres de todas las tablas de la base de datos.
$result=mysqli_query($con, 'SHOW TABLES');
if($result){
    while($row=mysqli_fetch_row($result)){
        $tables[] = $row[0];
    }
    // Se inicia la construcción del script SQL de la copia de seguridad.
    $sql='SET FOREIGN_KEY_CHECKS=0;'."\n\n";
    $sql.='CREATE DATABASE IF NOT EXISTS '.BD.";\n\n";
    $sql.='USE '.BD.";\n\n";

    // Se recorren todas las tablas para obtener sus datos y estructura.
    foreach($tables as $table){
        $result=mysqli_query($con, 'SELECT * FROM '.$table);
        if($result){
            $numFields=mysqli_num_fields($result);

            // Se agrega el código SQL para eliminar la tabla si existe y luego recrearla con su estructura.
            $sql.='DROP TABLE IF EXISTS '.$table.';';
            $row2=mysqli_fetch_row(mysqli_query($con,'SHOW CREATE TABLE '.$table));
            $sql.="\n\n".$row2[1].";\n\n";

            // Se recorren los registros de la tabla y se generan las sentencias INSERT.
            for ($i=0; $i < $numFields; $i++){
                while($row=mysqli_fetch_row($result)){
                    $sql.='INSERT INTO '.$table.' VALUES(';
                    for($j=0; $j<$numFields; $j++){
                        $row[$j]=addslashes($row[$j]);
                        $row[$j]=str_replace("\n","\\n",$row[$j]);
                        if (isset($row[$j])){
                            $sql .= '"'.$row[$j].'"' ;
                        }
                        else{
                            $sql.= '""';
                        }
                        if ($j < ($numFields-1)){
                            $sql .= ',';
                        }
                    }
                    $sql.= ");\n";
                }
            }
            $sql.="\n\n\n";
        }else{
            // Si ocurre algún error en la consulta de una tabla, se marca el error.
            $error=1;
        }
    }
    if($error==1){
        // Si ocurrió algún error durante la copia de seguridad, se muestra un mensaje de alerta.
        echo '<script> alert("Ocurrio un error.");</script>';
    }else{
        // Si no hubo errores, se procede a realizar la copia de seguridad.

        // Se establecen los permisos adecuados para la carpeta de copias de seguridad.
        chmod(BACKUP_PATH, 0777);

        // Se habilitan nuevamente las comprobaciones de claves foráneas.
        $sql.='SET FOREIGN_KEY_CHECKS=1;';

        // Se crea y escribe el archivo de copia de seguridad.
        $handle=fopen(BACKUP_PATH.$DataBASE,'w+');
        if(fwrite($handle, $sql)){
            // Si la escritura fue exitosa, se muestra un mensaje de alerta y se redirecciona a la página de copias de seguridad.
            fclose($handle);
            echo '<script> alert("Backup Realizado con Exito.");</script>';
       echo '<script> window.location="../copiaseguridad.php"; </script>';
        }else{
            // Si hubo un error al escribir el archivo, se muestra un mensaje de alerta.
             echo '<script> alert("Ocurrio un error.");</script>';
        }
    }
}else{
    // Si ocurre algún error en la consulta de las tablas, se muestra un mensaje de error.
    echo '<script> alert("Ocurrio un error.");</script>';
}

// Se libera la memoria del resultado de la consulta SHOW TABLES.
mysqli_free_result($result);