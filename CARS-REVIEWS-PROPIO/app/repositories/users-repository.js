"use strict";

const database = require("../infrastructure/database");

async function findAllUsers() {
  // LLAMAR BASE DE DATOS
  return "getUsers";
}

async function findUserByEmail(email) {
  const pool = await database.getPool();
  const query = "SELECT * FROM users WHERE email = ?";
  const [user] = await pool.query(query, email);
  return user[0];
}

async function createUser(name, email, passwordHash, role) {
  const pool = await database.getPool();
  const insertQuery =
    "INSERT INTO users (name, email, password, role) VALUES(?, ?, ?, ?)";
  const [created] = await pool.query(insertQuery, [
    name,
    email,
    passwordHash,
    role,
  ]);
  return created.insertId;
}

async function addVerificationCode(userId, code) {
  const now = new Date();
  const createdAt = now.toISOString().substring(0, 19).replace("T", " ");
  const data = {
    user_id: userId,
    verification_code: code,
    created_at: createdAt,
  };
  const pool = await database.getPool();
  const insertQuery = "INSERT INTO users_activation SET ?";
  const [created] = await pool.query(insertQuery, data);

  return created.insertId;
}

async function validateActivation(code) {
  const now = new Date();
  const verifiedAt = now.toISOString().substring(0, 19).replace("T", " ");

  const pool = await database.getPool();
  const updateQuery = `UPDATE users_activation
   SET verified_at = ?
   WHERE verification_code = ?
   AND verified_at IS NULL`;
  const [validation] = await pool.query(updateQuery, [verifiedAt, code]);
  if (validation.affectedRows === 1) {
    return true;
  }

  return false;
}

module.exports = {
  findAllUsers,
  findUserByEmail,
  createUser,
  addVerificationCode,
  validateActivation,
};
