<script>
    $(document).ready(function() {
        $(".prestar-btn").on("click", function() {
            var nombre_libro = $(this).data("nombre");
            var nombre_usuario = "<?php echo $_SESSION['usuario']; ?>";

			// Agregar un parámetro único para evitar caché
            var uniqueParam = new Date().getTime();
            var url = "codigo_qr.php?timestamp=" + uniqueParam;

            // Realizar la petición AJAX para generar el código QR
            $.ajax({
                type: "POST",
                url: "generar_qr.php", // Archivo PHP para generar el QR
                data: { nombre_usuario: nombre_usuario, nombre_libro: nombre_libro },
                success: function(data) {
                    // Mostrar el código QR en la ventana modal
                    $("#codigo-qr-container").html(data);
                    $("#codigoQRModal").modal("show");
                },
                error: function(xhr, status, error) {
                    console.log("Error en la petición AJAX:", xhr.responseText, status, error);
                    alert("Error al generar el código QR.");
                }
            });
        })
    });
</script>