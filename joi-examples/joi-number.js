const Joi = require("joi");

const nuestaVariable = 16;

const schema = Joi.number().positive().min(4).max(15);

const validation = schema.validate(nuestaVariable);

if (validation.error) {
  console.log(validation.error.message);
} else {
  console.log("todo ok");
}
