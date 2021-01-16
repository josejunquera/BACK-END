const Joi = require("joi");

const palabrotas = ["mierda", "gilipollas"];

const schema = Joi.any().invalid(...palabrotas);

const nuestaVariable = "mierda";

const validation = schema.validate(nuestaVariable);

if (validation.error) {
  console.log(validation.error.message);
} else {
  console.log("todo ok");
}
