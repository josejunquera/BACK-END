"use strict";

const express = require("express");
const axios = require("axios");

const app = express();

app.get("/random", async (req, res) => {
  try {
    const randomUser = await axios({
      method: "get",
      url: "https://randomuser.me/api/",
    });

    console.log(randomUser);

    const [user] = randomUser.data.results;

    res.send(`${user.name.title} ${user.name.first} ${user.name.last}`);
  } catch (err) {
    res.status(400).send("Error");
  }
});

app.listen(3045, () => console.log("Listening port 3045"));
