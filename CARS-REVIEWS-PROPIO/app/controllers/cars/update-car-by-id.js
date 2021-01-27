"use strict";

const Joi = require("joi");
const {
  findById,
  findByBrandAndModel,
  updateById,
} = require("../../repositories/cars-repository");
const createJsonError = require("../errors/create-json-errors");

const schemaId = Joi.number().positive().required();

const schema = Joi.object().keys({
  brand: Joi.string().alphanum().min(3).max(20).required(),
  model: Joi.string().alphanum().min(2).max(20).required(),
  year: Joi.number().min(1980).max(new Date().getFullYear()),
});

async function updateCarById(req, res) {
  try {
    if (req.auth.role !== "admin") {
      const error = new Error("No tiene permiso para realizar esta acción");
      error.status = 401;
      throw error;
    }
    const { id } = req.params;

    // Validamos el parametro id
    await schemaId.validateAsync(id);

    // Validamos que existe el coche
    const car = await findById(parseInt(id));
    if (!car) {
      const error = new Error("Id not available");
      error.status = 400;
      throw error;
    }

    // Validamos el body que nos envian
    await schema.validateAsync(req.body);

    const { brand, model, year } = req.body;

    // Validamos que no existe el coche y el modelo
    const existCar = await findByBrandAndModel(brand, model);
    if (existCar && existCar.id !== parseInt(id)) {
      const error = new Error(
        `Ya existe ese modelo de coche en la aplicación ID: ${existCar.id}`
      );
      error.status = 409;
      throw error;
    }

    // Actualizamos el coche
    const updatedCar = {
      brand,
      model,
      year,
    };
    await updateById(parseInt(id), updatedCar);

    res.status(200).send({ id, brand, model, year });
  } catch (err) {
    createJsonError(err, res);
  }
}

module.exports = updateCarById;
