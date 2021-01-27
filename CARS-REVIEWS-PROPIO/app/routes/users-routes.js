"use strict";

const express = require("express");
const loginUser = require("../controllers/users/login-user");
const registerUsers = require("../controllers/users/register-users");
const activateUser = require("../controllers/users/activate-users");

const router = express.Router();

//api/v1/users
router.route("/register").post((req, res) => registerUsers(req, res));

router.route("/login").post((req, res) => loginUser(req, res));

router.route("/activation").get((req, res) => activateUser(req, res));

module.exports = router;
