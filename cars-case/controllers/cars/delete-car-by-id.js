const { deleteById } = require("../../repositories/cars-repository");

function deleteCarById(req, res) {
  const { id } = req.params;
  const deletedCar = deleteById(+id);

  res.status(201).send(deletedCar);
}

module.exports = deleteCarById;
