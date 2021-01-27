"use strict";

const jwt = require("jsonwebtoken");
const { JWT_SECRET } = process.env;

function validateAuth(req, res, next) {
  try {
    const { authorization } = req.headers;

    if (!authorization || !authorization.startsWith("Bearer")) {
      const error = new Error("Authorization required");
      error.status = 403;
      throw error;
    }
    const accessToken = authorization.split(" ")[1];

    const payload = jwt.verify(accessToken, JWT_SECRET);
    const { id, name, role } = payload;

    // console.log(accessToken, JWT_SECRET);
    // console.log(payload);

    req.auth = { id, name, role };

    next();
  } catch (err) {
    res.status(401);
    res.send(err.message);
  }
}

module.exports = validateAuth;
