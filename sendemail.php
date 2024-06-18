<?php
    // Establece la cabecera de la respuesta como JSON.
	header('Content-type: application/json');

    // Crea un arreglo asociativo que contiene un mensaje de éxito.
	$status = array(
		'type'=>'success',
		'message'=>'Thank you for contact us. As early as possible  we will contact you '
	);

    // Obtiene los datos enviados por el formulario.
    $name       = @trim(stripslashes($_POST['name'])); 
    $email      = @trim(stripslashes($_POST['email'])); 
    $subject    = @trim(stripslashes($_POST['subject'])); 
    $message    = @trim(stripslashes($_POST['message'])); 

    // Establece la dirección de correo electrónico del remitente y del destinatario.
    $email_from = $email;
    $email_to = 'jtoroblandon@email.com';

    // Crea el cuerpo del mensaje con los datos del formulario.
    $body = 'Name: ' . $name . "\n\n" . 'Email: ' . $email . "\n\n" . 'Subject: ' . $subject . "\n\n" . 'Message: ' . $message;

    // Envía el correo electrónico.
    $success = @mail($email_to, $subject, $body, 'From: <'.$email_from.'>');

    // Imprime el arreglo como JSON para enviar la respuesta al cliente.
    echo json_encode($status);

    // Termina la ejecución del script.
    die;