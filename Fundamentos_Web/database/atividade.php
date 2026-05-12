<?php

$servidor = "127.0.0.1";
$usuario = "root";
$senha = "";
$banco = "atividade";

$conexao = new mysqli($servidor, $usuario, $senha, $banco);

if ($conexao->connect_error) {
    die("Erro na conexão: " . $conexao->connect_error . "\n");
}

echo "Conectado com sucesso!\n";

function buscarFuncaoFuncionario($conexao, $nomeFuncionario){

    $sql = "
        SELECT funcionarios.nome_funcionario, funcoes.descricao
        FROM funcionarios, funcoes
        WHERE funcionarios.idFuncao = funcoes.id_funcao
        AND funcionarios.nome_funcionario = '$nomeFuncionario'
    ";

    $resultado = $conexao->query($sql);

    if (!$resultado){
        die("Erro na consulta: " . $conexao->error . "\n");
    }

    if ($resultado->num_rows > 0){

        while($funcionario = $resultado->fetch_assoc()){
            echo "Funcionário " . $funcionario["nome_funcionario"] .
                 " tem a função " . $funcionario["descricao"] . "\n";
        }

    } else {
        echo "Funcionário não encontrado!\n";
    }
}

buscarFuncaoFuncionario($conexao, "Nayra");

$conexao->close();

?>

<!-- para roda => c:\xampp\php\php.exe .\atividade.php -->