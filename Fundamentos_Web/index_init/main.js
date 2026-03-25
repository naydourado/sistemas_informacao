// document.getElementById("titulo").textContent = "mudamos o texto"

// let botao = document.getElementById("botao_gato")

// let itemId = "tecla_gato"

// botao.onclick = document.getElementById("tecla_gato").play()
// ele não executa de cara, porque o navegador tem um bloqueio de segurança, 
// para funcionar, precisa de uma função

function play_som(itemId) {
    document.getElementById(itemId).play()
}

let listaDeTeclas = document.querySelectorAll(".tecla")

for (let contador = 0; contador < listaDeTeclas.length; contador++) {
    let botao = listaDeTeclas[contador]
    let itemId = listaDeTeclas[contador].classList[1]

    botao.onclick = function () {
        play_som(itemId)
    }
}

// console.log(botao)
// console.log(itemId)