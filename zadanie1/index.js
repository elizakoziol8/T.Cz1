const express = require("express");
// const fetch = require('node-fetch');
const app = express();

const port = process.env.PORT || 5000;
const date = new Date();
var requestify = require('requestify');


app.get('/', (req, res) => {
    requestify.get('https://ipapi.co/json')
        .then(function (response) {
            res.write("Adres IP klienta: " + response.getBody().ip + "\n");
            res.write("Strefa czasowa klienta: " + response.getBody().timezone + "\n");
            let dateTime = new Date().toLocaleString("pl-PL", {
                    timeZone: response.getBody().timezone,
            });
            res.write(`Data i godzina w strefie czasowej klienta:  ${dateTime}`);
            res.send();
        })
        .fail(function(response) {
            response.getCode(); 
        });

});

app.listen(port, () => {
    console.log("Autor: Eliza Kozioł");
    console.log(`Port TCP: ${port}`);
    console.log(`Data uruchomienia: ${date}`)
});