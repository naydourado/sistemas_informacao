// @autor Nayra, Isabela e Brunno

const mysql = require("mysql2");
const express = require("express");
const session = require("express-session");
const path = require("path");
const req = require("express/lib/request");
// calculando o hash
const crypto = require('crypto')

const connection = mysql.createConnection({
    host: 'localhost',
    user: 'root',
    password: '',
    database: 'nodelogin'
});

const app = express();

app.use(session({
    secret: 'secret',
    resave: true,
    saveUninitialized: true
}));

app.use(express.json())
app.use(express.urlencoded({ extended: true }));
app.use(express.static(path.join(__dirname, 'static')));

app.get('/', function (request, response) {
    response.sendFile(path.join(__dirname + '/login.html'));
});

app.post('/auth', function (request, response) {
    let username = request.body.username;
    let password = request.body.password;

    if (username && password) {
        // Gera o hash SHA-256 da senha informada
        const hash = crypto.createHash('sha256').update(password).digest('hex');
        
        // Busca o usuário com a senha criptografada
        connection.query(
            'SELECT * FROM accounts WHERE username = ? AND password = ?', 
            [username, hash], 
            function (error, results) {
                if (error) throw error;

                if (results.length > 0) {
                    request.session.loggedin = true;
                    request.session.username = username;
                    response.redirect('/home');
                } else {
                    response.send('Usuário ou senhas incorretos');
                }
                response.end();
            }
        );
    } else {
        response.send('Preencha o usuário e a senha');
        response.end();
    }
});

app.get('/home', function(request, response){
    if(request.session.loggedin){
        // Envia a página protegida
        response.sendFile(path.join(__dirname + '/static/home.html'));
    }else {
        // Redireciona de volta ao login se não estiver logado
        response.send('/');
    }
})

app.get('/logout', function(request, response){
    request.session.destroy((err) => {
        if (err) {
            return response.send('Erro ao encerrar a sessão.');
        }
        response.redirect('/');
    });
});

app.listen(1950);