const Joi = require("joi");

const nuestaVariable = "47039604k";

const schema = Joi.string().alphanum().max(9).required();

const validation = schema.validate(nuestaVariable);

if (validation.error) {
  console.log(validation.error.message);
} else {
  console.log("todo ok");
}
