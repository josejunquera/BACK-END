require("dotenv").config();
const express = require("express");
const { SERVER_PORT } = process.env;
const app = express();

const { logger } = require("./logger.js");

app.use(async (req, res, next) => {
  await logger(req.url);
  next();
});

app.post("/users/create", (req, res) => {
  res.send("Estoy en /users/create con el metodo post");
});

app.get("/users/read", (req, res) => {
  res.send("Estoy en /users/read con el metodo get");
});

app.put("/users/update", (req, res) => {
  res.send("Estoy en /users/update con el metodo put");
});

app.delete("/users/delete", (req, res) => {
  res.send("Estoy en /users/delete con el metodo delete");
});

app.listen(SERVER_PORT, () => console.log("Escuchando..."));
