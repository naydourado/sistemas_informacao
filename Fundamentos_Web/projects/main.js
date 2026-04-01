function Adicionar() {
    const inputTarefa = document.getElementById("campo-tarefa").value
    const lista = document.getElementById("lista")

    const tarefaAdicionada = document.createElement("li")

    const tarefa = document.createElement("span")
    tarefa.textContent = inputTarefa

    const concluir = document.createElement("button")
    concluir.textContent = "Concluir"

    const excluir = document.createElement("button")
    excluir.textContent = "Excluir"

    tarefaAdicionada.appendChild(tarefa)
    tarefaAdicionada.appendChild(concluir)
    tarefaAdicionada.appendChild(excluir)
    lista.append(tarefaAdicionada)

    concluir.onclick = function () {
        tarefaAdicionada.classList.add("concluida")
    }

    excluir.onclick = function () {
        tarefaAdicionada.remove()
    }
}

document.getElementById("botao-adicionar").onclick = Adicionar

// 1º Coletar texto do Input
// 2° Criar li
// 3º Criar 2 botões
// 4º Append (adicionar na lista) dos 3 elementos na lista li
// 5º Append do li pronto na tag ul