const { create } = require("../../repositories/cars-repository");
const Joi = require("joi");

const schema = Joi.object().keys({
  brand: Joi.string().required().min(2),
  model: Joi.string().required(),
  year: Joi.number().positive(),
});

function createCar(req, res) {
  try {
    Joi.assert(req.body, schema);
    const { brand, model, year } = req.body;

    const car = { brand, model, year };
    const addedCar = create(car);

    res.status(201).send(addedCar);
  } catch (err) {
    console.error(err.message);
    res.status(400).send({ error: err.message });
  }
}

module.exports = createCar;
