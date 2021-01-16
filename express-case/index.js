require("dotenv").config();
const express = require("express");
const { SERVER_PORT } = process.env;
const app = express();

// app.use((),(req,res,next)=>{
//     console.log("casa");
// });

app.get("/", (req, res) => {
  res.send(
    '<form method="post">' +
      '<p>Title: <input type="text" name="title" /><p>' +
      '<p>Description: <input type="text" name="descrizdsdfsdfption" /><p>' +
      '<p><input type="submit" value="Submit"></p' +
      "</form>"
  );
});

app.post("/", (req, res) => {
  res.send("formulario recibido");
});

app.listen(SERVER_PORT, () => console.log("Escuchando..."));
