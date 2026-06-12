const botao = document.getElementById("btnCadastrar");
const form = document.getElementById("formCadastro");

async function cadastro(event){
    const usuario = document.getElementById("usuario").value;
    const senha = document.getElementById("senha").value;
    const email = document.getElementById("email").value;

    if (usuario === "" || senha === "" || email === ""){
        alert("Preencher todos os campos");
        event.preventDefault();
        return;
    }

    event.preventDefault(); 

    try {
        const resposta = await fetch(`php/verificar_usuario.php?usuario=${usuario}`);
        const resultado = await resposta.json();
        
        if (resultado.existe) {
            alert("Este nome de usuário já está em uso!");
        } else {
            form.submit();
        }
    } catch (erro) {
        console.error("Erro na checagem:", erro);
        alert("Erro ao validar usuário. Tente novamente.");
    }
}

botao.addEventListener("click", cadastro);

const mensagem = new URLSearchParams(window.location.search).get("msg");
if (mensagem) {
    alert(mensagem);
}