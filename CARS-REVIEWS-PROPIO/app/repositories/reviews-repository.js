"use strict";

const database = require("../infrastructure/database");

async function addReview(userId, carId, comment, rating) {
  const pool = await database.getPool();
  const insertQuery =
    "INSERT INTO reviews (user_id, car_id, comment, rating) VALUES (?, ?, ?, ?)";
  const [created] = await pool.query(insertQuery, [
    userId,
    carId,
    comment,
    rating,
  ]);

  return created.insertId;
}

module.exports = { addReview };
