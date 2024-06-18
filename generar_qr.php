<?php

//Se incluye la libreria generadora de QR
require_once "phpqrcode/phpqrcode.php";

if ($_SERVER["REQUEST_METHOD"] === "POST") {
    // Obtener los datos del formulario AJAX
    $nombre_usuario = $_POST["nombre_usuario"];
    $nombre_libro = $_POST["nombre_libro"];

    // Información para el código QR
    $informacion = "Usuario: " . $nombre_usuario . "\nFecha del préstamo: " . date("Y-m-d") . "\nLibro prestado: " . $nombre_libro;

    // Ruta y nombre del archivo del código QR
    $rutaArchivoQR = "QR/" . $nombre_usuario . "_qr.png";

    // Generar el código QR
    QRcode::png($informacion, $rutaArchivoQR);

    // Devolver la imagen del código QR
    echo '<img src="' . $rutaArchivoQR . '" alt="Código QR">';
}

// Deshabilitar la caché
header("Cache-Control: no-cache, must-revalidate");
header("Expires: Sat, 1 Jan 2000 00:00:00 GMT");
?>