// // Variaveis:
// nome = "Brunno"

// // var => var nome = "Brunno" -> Antiga! Não esta em uso!
// // let => let nome = "Brunno"
// // const => const nome = "Brunno"

// let nome = "Brunno"
// console.log(typeof nome)

// let idade = 20
// console.log(typeof idade)

// let estaChovendo = false
// console.log(typeof estaChovendo)

// let var_nula = false
// console.log(typeof var_nula)

// let simbolo = Symboll()
// console.log(typeof simbolo)

// //---------------------------------------------------

// let minha_lista = ["banana", "maca", "uva", "morango"]
// console.log[minha_lista]
// console.log[minha_lista[2]]
// minha_lista.splice(2, 1)
// console.log(minha_lista)

// let meu_objeto = {
//     nome: "Brunno",
//     idade: 20,
//     altura: 1.7
// }

// const keys = Object.keys(meu_objeto)
// const values = Objects.values(meu_objeto)
// console.log(keys)
// console.log(values)

// //------------------------------

// const primeiro_numero = 10
// const segundo_numero = 20

// const soma = primeiro_numero + segundo_numero
// console.log("SOMA: ", soma)

// const subtracao = primeiro_numero - segundo_numero
// console.log("SUBTRAÇÃO: ", subtracao)

// const divisao = primeiro_numero / segundo_numero
// console.log("DIVISÃO: ", divisao)

// const mult = primeiro_numero * segundo_numero
// console.log("MULTIPLICAÇÃO: ", mult)

// const modulo = primeiro_numero % segundo_numero
// console.log("MODOLO: ", modolo)

// let contador = 0
// contador += 3
// console.log("CONTADOR: ", contador)

// //-----------------------------------------
// // AND OR NOT

// const age = 17
// const maior_idade = age >= 18
// const possui_cnh = false

// console.log("pode dirigir", maior_idade && possui_cnh)
// console.log("VIJAR SOZINHO: ", maior_idade || possui_cnh)

// //-------------------------------------
// const minha_idade = 25

// if (minha_idade > 18){
//     console.log("MAIOR DE IDADE")
// } else{
//     console.log("MENOR DE IDADE")
// }

// if (minha_idade < 18){
//     console.log("MENOR DE IDADE")
// } else if (minha_idade > 60) {
//     console.log("IDOSO")
// } else {
//     console.log("NADA")
// }

// ----------------------------------------
// let i = 0

// while (i < 10) {
//     if (i % 2 == 0) {
//         console.log("O número", i, "é par")
//     } else {
//         console.log("O número", i, "é ímpar")
//     }
//     i++
// }

let nome = "Nayra"

for (let letra = 0; letra < nome.length; letra++){
    console.log(nome[letra])
}
