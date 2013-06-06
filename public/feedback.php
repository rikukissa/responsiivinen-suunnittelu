<?php
  ini_set('display_errors', '1');

  call_user_func(function() {
    $_POST['name']    = !isset($_POST['name']) ? "Anonyymi" : $_POST['name'];
    $_POST['email']   = !isset($_POST['email']) ? "" : $_POST['email'];
    $_POST['message'] = !isset($_POST['message']) ? "" : $_POST['message'];

    $headers = "From: {$_POST["email"]}"; 

    if(mail("riku.rouvila@gmail.com", "Palaute JWT-harkkatyöstä", $_POST["message"], $headers)) {
      return header("HTTP/1.1 200 OK");
    }
    return header("HTTP/1.1 418 I'm a teapot");
  });