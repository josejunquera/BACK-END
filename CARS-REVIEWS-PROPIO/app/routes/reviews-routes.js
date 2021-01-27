"use strict";

const express = require("express");
const validateAuth = require("../middlewares/validate-auth");
const createReview = require("../controllers/reviews/create-review");

const router = express.Router();

//Privadas
router
  .route("/")
  .all(validateAuth)
  .post((req, res) => createReview(req, res));

module.exports = router;
