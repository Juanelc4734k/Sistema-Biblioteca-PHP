<?php
session_start();
include("conexion.php");
if(isset($_SESSION['user']))
 {?>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <meta name="description" content="">
    <meta name="author" content="">
    <title>Biblioteca-11 | Panel Administracion</title>
    <link rel="shortcut icon" href="../images/iconolibreria.ico">
    <link href="css/bootstrap.min.css" rel="stylesheet">  
    <link href="css/sb-admin.css" rel="stylesheet">
    <link href="css/morris.css" rel="stylesheet">
    <link href="font-awesome/css/font-awesome.min.css" rel="stylesheet" type="text/css">
    <script src="js/jquery.js"></script>
    <!-- Bootstrap Core JavaScript -->
    <script src="js/bootstrap.min.js"></script>
    <script src="comentarios/Mis_funciones.js"></script>
    <script src="bootstrap/js/bootstrap.min.js"></script>
    <script src="bootstrap/js/bootstrap.js"></script>
</head>
<body>
      <?php include('navegacion.php');?>
        <div id="page-wrapper">
            <div class="container-fluid">
                <!-- Page Heading -->
                <div class="row">
                    <div class="col-lg-12">
                        <h2 class="page-header">
                            <small><img src="images/logo.png"></small> Listado de Prestamos
                        </h2>
                    </div>
                </div>
                <!-- /.row -->
                <div class='row'>   <!-- /.Inicia el primer row -->
                <div align="center">
                <?php
                $registro = mysqli_query($con, "SELECT prestamo_libro.id_prestamo AS prestamo, 
                                                 prestamo_libro.fecha_prestamo AS fecha_prestamo, 
                                                 prestamo_libro.fecha_entrega AS fecha_entrega, 
                                                 libros.nombre AS nombre_libro, 
                                                 visitantes.usuario AS nombre_usuario, 
                                                 prestamo_libro.estado AS estado 
                                                 FROM prestamo_libro
                                                 INNER JOIN libros ON prestamo_libro.id_libro = libros.id_libro
                                                 INNER JOIN visitantes ON prestamo_libro.idvisitante = visitantes.idvisitante");

                echo '<table width="900" class="table table-striped table-condensed table-hover">
                           <tr>    
                                <td><p> <p></td>
                                <td><p>Prestamo<p></td>
                                <td><p>Fecha Prestamo<p></td>
                                <td><p>Fecha Entrega</p></td>
                                <td ><p>Libro</p></td>
                                <td><p>Nombre de Usuario</p></td>
                                <td><p>Estado</p></td>
                                <td><p>Opciones</p></td>
                              </tr>';
                if ($registro !== false && mysqli_num_rows($registro) > 0) {
                    while ($registro2 = mysqli_fetch_assoc($registro)) {
                        $id = $registro2['prestamo'];

                        $nombre_libro = isset($registro2['nombre_libro']) ? $registro2['nombre_libro'] : 'N/A';
                        $fecha_prestamo = isset($registro2['fecha_prestamo']) ? $registro2['fecha_prestamo'] : 'N/A';
                        $fecha_entrega = isset($registro2['fecha_entrega']) ? $registro2['fecha_entrega'] : 'N/A';
                        $nombre_usuario = isset($registro2['nombre_usuario']) ? $registro2['nombre_usuario'] : 'N/A';
                        $estado = isset($registro2['estado']) ? $registro2['estado'] : 'N/A';

                        echo '<tr';
                        switch ($estado) {
                            case 0:
                                echo ' style="background:red; color:white;"';
                                break;
                            case 1:
                                echo ' style="background:green; color:white;"';
                                break;
                        }
                        echo '>
                            <td> </td>
                            <td>' . $id . '</td>
                            <td>' . $fecha_prestamo . '</td>
                            <td>' . $fecha_entrega . '</td>
                            <td>' . $nombre_libro . '</td>
                            <td>' . $nombre_usuario . '</td>
                            <td>' . $estado . '</td>';

                        if ($estado == "prestado") {
                            echo '
                            <td><a href="prestamos_libros/entregar_libro.php?id=' . $id . '"><button class="btn btn-success btn-xs">Devolver</button></a></td>
                            </tr>';
                        }
                    }
                } else {
                    echo '<tr>
                            <td colspan="7">No se encontraron resultados</td>
                          </tr>';
                }
                echo '</table>';
                ?>
</div>

                         <script src="js/jquery.js"></script>
                      <script src="js/bootstrap.min.js"></script>

               </div>  <!-- /. fin de row -->
            </div>
        </div>
    </div>
    <script src="js/jquery.js"></script>
    <script src="js/bootstrap.min.js"></script>
    <script src="js/plugins/morris/raphael.min.js"></script>
    <script src="js/plugins/morris/morris.min.js"></script>
    <script src="js/plugins/morris/morris-data.js"></script>
</body>
</html>
<?php
}else{
    echo '<script> window.location="../login/login.php"; </script>';
}
?>
