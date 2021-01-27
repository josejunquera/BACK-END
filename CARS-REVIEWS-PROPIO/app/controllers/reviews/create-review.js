"use strict";

const { async } = require("crypto-random-string");
const Joi = require("joi");
const { findById } = require("../../repositories/cars-repository");
const { addReview } = require("../../repositories/reviews-repository");
const createJsonError = require("../errors/create-json-errors");

//POST api/v1/reviews
const schema = Joi.object().keys({
  carId: Joi.number().positive().required(),
  comment: Joi.string().min(5).max(255),
  rating: Joi.number().min(0).max(10).required(),
});

async function createReview(req, res) {
  try {
    const { id } = req.auth;

    await schema.validateAsync(req.body);
    const { carId, comment, rating } = req.body;

    const car = await findById(carId);
    if (!car) {
      const error = new Error("Coche no existe");
      error.status = 400;
      throw error;
    }
    const idReview = await addReview(id, carId, comment, rating);

    res.send({ idReview, carId, comment, rating });
  } catch (err) {
    createJsonError(err, res);
  }
}

module.exports = createReview;
