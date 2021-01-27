"use-strict";

const sendgrid = require("@sendgrid/mail");

async function sendEmailRegistration(name, email) {
  const { HTTP_SERVER_DOMAIN, SENDGRID_KEY, SENDGRID_MAIL_FORM } = process.env;

  const verificationCode = cryptoRandomString({ length: 64 });
  const linkActivation = `${HTTP_SERVER_DOMAIN}/api/v1/users/activation?verification_code=${verificationCode}`;
  console.log(linkActivation);
  sendgrid.setApiKey(SENDGRID_KEY);
  const contentEmail = {
    from: SENDGRID_MAIL_FORM,
    to: email,
    subject: "Bienvenido a Cars App",
    text: `Hola ${name}.\nBienvenido a nuestra app. Confirma tu usuario <a href=${linkActivation}\n`,
    html: `<h1>Hola ${name}</h1><p>Bienvenido a nuestra app.
    Confirma tu usuario <a href=${linkActivation}>aquí</a></p>`,
  };
  await sendgrid.send(contentEmail);
}

module.exports = {
  sendEmailRegistration,
};
