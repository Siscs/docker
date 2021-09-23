const express = require('express');

const PORT = 8080;
const HOST = '0.0.0.0';

const app = express();

app.get('/', (req, res) => {
    let mensagem = '*********************************<br>'
    mensagem += '<h1>Ola sou o Express by Siscs V2.1</h1><br>'
    mensagem += '*********************************<br>'
    
    res.send(mensagem);
    
});

console.log('Iniciando express..........');
app.listen(PORT, HOST);
