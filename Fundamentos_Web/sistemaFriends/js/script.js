document.addEventListener("DOMContentLoaded", function() {

    const formLogin = document.querySelector("form");

    if(formLogin){
        formLogin.addEventListener("submit", function(event) {

            const usuario = document.getElementById("usuario").value;
            const senha = document.getElementById("senha").value;

            if(usuario === "" || senha === ""){
                alert("Preencher todos os campos");
                event.preventDefault();
            } else {
                localStorage.setItem("usuarioLogado", usuario);
            }
        });
    }

    const nomeUsuario = document.getElementById("nomeUsuario");

    if(nomeUsuario){
        const usuario = localStorage.getItem("usuarioLogado");

        if(usuario){
            nomeUsuario.textContent = `Olá, ${usuario}!`;
        }
    }

    const btnLogout = document.getElementById("btnLogout");

    if(btnLogout){
        btnLogout.addEventListener("click", function() {

            localStorage.removeItem("usuarioLogado");

            window.location.href = "index.html";
        });
    }

    const mensagem = new URLSearchParams(window.location.search).get("msg");

    if(mensagem){
        alert(mensagem);
    }

});