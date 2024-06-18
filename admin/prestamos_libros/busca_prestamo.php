<?php
include('../conexion.php');
$dato = mysqli_real_escape_string($con, $_POST['dato']);

$consulta = "SELECT l.id_libro, l.nombre, l.descripcion, l.estado, l.foto
             FROM libros l
             WHERE l.nombre LIKE '%$dato%'
             ORDER BY l.id_libro ASC";

$registro = mysqli_query($con, $consulta) or die(mysqli_error($con));

echo '<table class="table table-striped table-condensed table-hover">
        	<tr>
            	<th width="300">Nombre</th>
            	<th width="300">Descripcion</th>
            	<th width="100">Disponible</th>
				<th width="50">Opciones</th>
				<td></td>
            </tr>';
if(mysqli_num_rows($registro)>0){
	while($registro2 = mysqli_fetch_assoc($registro)){
		$disponible = $registro2['estado'];
		$imagen = $registro2['foto'];
		switch($disponible){
	    	case "si":$diestado = "no servido";break;
	    	case "no":$diestado = "servido";break;
      	}
		echo '<tr';
		switch($disponible){
	  		case "si":echo ' style="background:rgb(200,255,200);"';break;
	  		case "no":echo ' style="background:rgb(255,200,200);"';break; 
     	}
		echo'>
				<td>'.$registro2['nombre'].'</td>
				<td>'.$registro2['descripcion'].'</td>
				<td>'.$registro2['estado'].'</td>';
		if($disponible=="si"){
            echo '<td><a href="prestamos_libros/ventana_prestamo.php?id='.$registro2['id_libro'].'"><button class="btn btn-primary btn-xs">Prestar</button></a></td>
				<td></td>';
		}
		if($disponible=="no"){
            echo '<td><a href="prestamos_libros/devolver_libro.php?id='.$registro2['id_libro'].'"><button class="btn btn-success btn-xs">Devolver</button></a></td>
				<td></td>';
		}
              
        echo '</tr>';		
    }
}else{
    echo '<tr>
			<td colspan="7">No se encontraron resultados</td>
		  </tr>';
}
echo '</table>';
?>
