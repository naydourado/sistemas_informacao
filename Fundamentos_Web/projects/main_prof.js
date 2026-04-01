const campoTarefa = document.getElementById("campo-tarefa")
const botaoAdicionar = document.getElementById("botao-adicionar")
const lista = document.getElementById("Lista")

function adicionarTarefa() {

    //Adiciona o texto da tarefa na lista
    let textoTarefa = campoTarefa.value

    let novaTarefa = document.createElement("li")

    let texto = document.createElement("span")
    texto.textContent = textoTarefa

    const botaoConcluir = document.createElement("button")
    botaoConcluir.textContent = "CONCLUIR"

    const botaoExcluir = document.createElement("button")
    botaoExcluir.textContent = "EXCLUIR"

    novaTarefa.appendChild(texto)
    novaTarefa.appendChild(botaoConcluir)
    novaTarefa.appendChild(botaoExcluir)

    lista.appendChild(novaTarefa)

    botaoExcluir.onclick = function() {
        novaTarefa.remove()
    }

    botaoConcluir.onclick = function() {
        novaTarefa.classList.add("concluida")
    }
}

botaoAdicionar.onclick = adicionarTarefa