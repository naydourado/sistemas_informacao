<?php

    // DEFINIR CREDENCIAIS:
    $servidor = "127.0.0.1";
    $usuario = "root";
    $senha = "";

    $conexao = new mysqli($servidor, $usuario, $senha);

    if ($conexao -> connection_error){
        die("Erro na conexão: " . $conexao->connection_error . ".\n");
    } else {
        echo "Conectou ao banco de dados com sucesso!\n";
    }
?>