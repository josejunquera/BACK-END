const Joi = require("joi");

const nuestaVariable = {
  email: "exmpak@akak.com",
  name: "manolo",
  lastname: "perez",
};

const schema = Joi.object().keys({
  email: Joi.string().email().required(),
  name: Joi.string().alphanum().min(3).max(20).required(),
  lastname: Joi.string().alphanum().min(3).max(20).required(),
});

const validation = schema.validate(nuestaVariable);

if (validation.error) {
  console.log(validation.error.message);
} else {
  console.log("todo ok");
}
