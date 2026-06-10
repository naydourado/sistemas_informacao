document.addEventListener("DOMContentLoaded", function() {
    const formLogin = document.querySelector("form");
    if(formLogin){
        formLogin.addEventListener("submit", function(event) {
            const usuario = document.getElementById("usuario").value;
            const senha = document.getElementById("senha").value;

            if(usuario === "" || senha === ""){
                alert("Preencher todos os campos");
                event.preventDefault(); 
            }
        });
    }

    const btnLogout = document.getElementById("btnLogout");
    if(btnLogout){
        btnLogout.addEventListener("click", function() {
            window.location.href = "index.html"; 
        });
    }

    const mensagem = new URLSearchParams(window.location.search).get("msg");
    if(mensagem){
        alert(mensagem);
    }
});