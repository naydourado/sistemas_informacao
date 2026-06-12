<?php
$host = "localhost";
$user = "root";
$senha_db = ""; 
$db = "usuarios";

$conn = new mysqli($host, $user, $senha_db, $db);

if ($conn->connect_error) {
    die(json_encode(["erro" => "Falha na conexão"]));
}

// verifica se o usuario existe
if (isset($_GET['usuario'])) {
    $usuario_check = $_GET['usuario'];
    
    $sql = "SELECT id FROM usuario WHERE user = ?";
    $stmt = $conn->prepare($sql);
    $stmt->bind_param("s", $usuario_check);
    $stmt->execute();
    $resultados = $stmt->get_result();
    
    echo json_encode(['existe' => $resultados->num_rows > 0]);
    $stmt->close();
    $conn->close();
    exit(); 
}

if (isset($_POST["usuario"]) && isset($_POST["senha"])) {
    $usuario = $_POST["usuario"];
    $senha = $_POST["senha"];

    $sql = "SELECT * FROM usuario WHERE user = ? AND senha = ?";
    $stmt = $conn->prepare($sql);
    $stmt->bind_param("ss", $usuario, $senha);
    
    $stmt->execute();
    $resultados = $stmt->get_result();

    if ($resultados->num_rows > 0){
        header("Location: ../home.html");
        exit();
    } else {
        header("Location: ../index.html?msg=Usuário NÃO Existe");
        exit();
    }

    $stmt->close();
}

$conn->close();
?>