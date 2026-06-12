<?php

$host = "localhost";
$user = "root";
$senha = "";
$db = "usuarios";

$conn = new mysqli($host, $user, $senha, $db);

if ($conn->connect_error) {
    die("Conexão falhou: " . $conn->connect_error);
}

$usuario = $_POST["usuario"];
$senha = $_POST["senha"];
$email = $_POST["email"];

$sql = "INSERT INTO usuario(user, senha, email) VALUES (?,?,?)";
$stmt = $conn->prepare($sql);
$stmt->bind_param("sss", $usuario, $senha, $email);

if ($stmt->execute()){
    header("Location: ../index.html?msg=USUARIO CADASTRADO COM SUCESSO");
} else {
    header("Location: ../index.html?msg=ERRO AO CADASTRAR USUARIO");
}

$stmt->close();
$conn->close();

?>