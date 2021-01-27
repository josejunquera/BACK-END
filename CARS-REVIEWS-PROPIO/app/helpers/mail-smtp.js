"use strict";

const nodemailer = require("nodemailer");
const cryptoRandomString = require("crypto-random-string");

const {
  HTTP_SERVER_DOMAIN,
  SMTP_PORT,
  SMTP_HOST,
  SMTP_USER,
  SMTP_PASS,
} = process.env;

const transporter = nodemailer.createTransport({
  port: SMTP_PORT,
  host: SMTP_HOST,
  auth: {
    user: SMTP_USER,
    pass: SMTP_PASS,
  },
  secure: false,
});

async function sendEmailRegistration(name, email, verificationCode) {
  const linkActivation = `${HTTP_SERVER_DOMAIN}/api/v1/users/activation?verification_code=${verificationCode}`;
  console.log(linkActivation);

  const mailData = {
    from: "youremail@gmail.com",
    to: email,
    subject: "Welcome to Car Reviews App",
    text: `Hi ${name}, To confirm the account activate it here: ${linkActivation}`,
    html: `Hi ${name}, To confirm the account <a href="${linkActivation}">activate it here</a>`,
  };
  console.log("mailData", mailData);
  const data = await transporter.sendMail(mailData);

  return data;
}

async function sendEmailCorrectValidation(name, email) {
  const mailData = {
    from: "youremail@gmail.com",
    to: email,
    subject: "[Car Reviews App] Account Activated!",
    text: `Hi ${name},\n Your account was be activated. Enjoy our apps`,
    html: `<p>Hi ${name},</p><p>Your account was be activated. Enjoy our app!</p>`,
  };

  const data = await transporter.sendMail(mailData);

  return data;
}

async function sendEmailWithAttachedFiles(email) {
  const mailData = {
    from: "youremail@gmail.com",
    to: email,
    subject: "Emails with files attached",
    text: "Email with files attached",
    html: "<b>Hey there! </b><br>Email with files attached<br/>",
    attachments: [
      {
        // file on disk as an attachment
        filename: "nodemailer.png",
        path: "nodemailer.png",
      },
      {
        // file on disk as an attachment
        filename: "text_file.txt",
        path: "text_file.txt",
      },
    ],
  };

  const data = await transporter.sendMail(mailData);

  return data;
}

module.exports = {
  sendEmailRegistration,
  sendEmailCorrectValidation,
};
