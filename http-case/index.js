require("dotenv").config();
const http = require("http");

const { SERVER_PORT, SERVER_HOST } = process.env;

// const hostname = "127.0.0.1";
// const port = 3000;

const server = http.createServer((req, res) => {
  const { method, url, headers } = req;
  if (url === "/") {
    res.statusCode = 200;
    res.setHeader("Content-Type", "application/json");
    res.end(JSON.stringify({ a: 1, b: 2, c: 3 }));
  } else if (method === "GET" && url === "/contact") {
    res.statusCode = 200;
    res.setHeader("Content-Type", "text/html; charset=utf-8");
    res.end(
      "<h1>Página de contacto GET</h1> <h2>Esto es un texto de ejemplo</h2>"
    );
  } else if (method === "POST" && url === "/contact") {
    res.statusCode = 200;
    res.setHeader("Content-Type", "text/html; charset=utf-8");
    res.end(
      "<h1>Página de contacto con post</h1> <h2>Esto es un texto de ejemplo</h2>"
    );
  } else {
    res.statusCode = 400;
    res.end("Page not found");
  }
});

// server.on("connection", (socket) => {
//   console.log("Recibida petición");
// });

server.listen(SERVER_PORT, SERVER_HOST, () => {
  console.log("Servidor escuchando...");
});
