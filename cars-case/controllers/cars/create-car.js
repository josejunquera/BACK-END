const { create } = require("../../repositories/cars-repository");

function createCar(req, res) {
  const { brand, model, year } = req.body;

  const car = { brand, model, year };
  const addedCar = create(car);

  res.status(201).send(addedCar);
}

module.exports = createCar;
