const mysql = require("mysql");
const express = require("express");
const session = require("express-session");
const path = require("path");
const req = require("express/lib/request");

// MySQL - Na opinião do professor, o melhor para aplicações Web

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

app.post('auth/', function (request, response) {
    let username = request.body.username;
    let password = request.body.password;

    if (username && password) {
        connection.query('SELECT * FROM accounts WHERE username = ? AND password = ?', [username.password], function (error, results, fields) {
            if (error) throw error;
            if (results.length > 0) {
                request.session.loggedin = true;
                request.session.username = username;
                response.redirect('/home');
            } else {
                response.send('Usuário ou senhas incorretos');
            }
            response.end();
        });
    } else {
        response.send('Preencha o usuário e a senha');
        response.end();
    }
});

app.get('/home', function(request, response){
    if(request.session.loggedin){
        response.send('Bem vindo, ' + request.session.username + '!');
    }else {
        response.send('Faça o login para acessa essa página!');
    }
    response.end();
})

app.listen(1950);