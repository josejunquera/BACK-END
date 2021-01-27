"use strict";

const createJsonError = require("../errors/create-json-errors");
const { validateActivation } = require("../../repositories/users-repository");
const Joi = require("joi");

const schema = Joi.string().max(64).min(64).required();

async function activateUser(req, res) {
  try {
    const { verification_code: verificationCode } = req.query;

    if (!verificationCode) {
      const error = new Error("Invalid verification Code");
      error.status(400);
      throw error;
    }
    await schema.validateAsync(verificationCode);

    const isActivated = await validateActivation(verificationCode);
    console.log(isActivated);
    if (!isActivated) {
      res.send("Account not activated. Verification code expired");
    } else {
      res.send("Account activated");
    }
  } catch (err) {
    createJsonError(err, res);
  }
}

module.exports = activateUser;
