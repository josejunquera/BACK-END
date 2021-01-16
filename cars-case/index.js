require("dotenv").config();
const carsRouter = require("./routes/cars-routes");
const express = require("express");
const app = express();
app.use(express.json());

app.use("/api/v1/cars", carsRouter);
// app.use("/api/v1/users", carsUsers);

const port = process.env.SERVER_PORT;
app.listen(port, () => console.log("Escuchando puerto..."));
