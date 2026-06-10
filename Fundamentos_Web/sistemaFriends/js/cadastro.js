const botao = document.getElementById("btnCadastrar");
const form = document.getElementById("formCadastro");

function cadastro(event){
    const usuario = document.getElementById("usuario").value;
    const senha = document.getElementById("senha").value;
    const email = document.getElementById("email").value;

    if (usuario === "" || senha === "" || email === ""){
        alert("Preencher todos os campos");
        event.preventDefault();
    }

    // if (senha != confirmarSenha){
    //  alert("As senhas devem ser iguais")
    //  event.preventDefault(); 
    // }
}

botao.addEventListener("click", cadastro);

const mensagem = new URLSearchParams(window.location.search).get("msg");

if (mensagem) {
    alert(mensagem);
}