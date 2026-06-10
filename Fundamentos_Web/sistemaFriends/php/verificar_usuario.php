<?php
$host = "localhost";
$user = "root";
$senha = "";
$db = "usuarios";

$conn = new mysqli($host, $user, $senha, $db);

$usuario = $_POST["usuario"];
$senha = $_POST["senha"];

$sql = "SELECT * FROM usuario WHERE user = ? AND senha = ?";
$stmt = $conn->prepare($sql);
$stmt->bind_param("ss", $usuario, $senha);

$stmt->execute();
$resultados = $stmt->get_result();

if ($resultados->num_rows > 0){
    header("Location: home.html");
    exit();
} else {
    header("Location: index.html?msg=Usuário NÃO Existe");
    exit();
}

$stmt->close();
$conn->close();
?>