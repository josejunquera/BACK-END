const express = require("express");
const router = express.Router();
const getCars = require("../controllers/cars/get-cars.js");
const getCarsById = require("../controllers/cars/get-car-by-id.js");
const createCar = require("../controllers/cars/create-car.js");
const deleteCarById = require("../controllers/cars/delete-car-by-id.js");

router
  .route("/")
  .get((req, res) => getCars(req, res))
  .post((req, res) => createCar(req, res));

router
  .route("/:id")
  .get((req, res) => getCarsById(req, res))
  .delete((req, res) => deleteCarById(req, res));

module.exports = router;
