const { findById } = require("../../repositories/cars-repository");

function getCarsById(req, res) {
  const { id } = req.params;

  const car = findById(parseInt(id));
  if (!car) {
    res.status(400).send("ID not avaliable");
  }

  res.send(car);
}

module.exports = getCarsById;
