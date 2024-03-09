const express = require("express");
const http = require("http");
const mongoose = require("mongoose");



const app = express();
const port = process.env.port || 3000;
var server = http.createServer(app);

app.use(express.json());

const DB =
    "mongodb+srv://Rahul:rahul123@cluster0.sspnvba.mongodb.net/?retryWrites=true&w=majority";




mongoose
    .connect(DB, { useNewUrlParser: true, useUnifiedTopology: true })
    .then(() => {
        console.log("Connection Successful");
    })
    .catch((e) => {
        console.log(e);
    });


server.listen(port, "0.0.0.0", () => {
    console.log("Server started and running on Port " + port);
});

