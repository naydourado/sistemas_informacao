const express = require("express");
const app = express();

app.set('view engine', 'ejs');

app.get("/", (req, res) => {
    var nome = "Nay";
    var lang = "Javascript";
    var exibirMsg = true;
    res.render("index", {
        nome: nome,
        lang: lang,
        alunos: 40,
        msg: exibirMsg
    });
})

app.listen(8080, () => {
    console.log("App rodando!");
})