"use strict";

const fs = require("fs").promises;
const path = require("path");
const sharp = require("sharp");

async function main(photo) {
  try {
    console.log(__dirname);
    const photoBuffer = await fs.readFile(path.join(__dirname, photo));

    const image = sharp(photoBuffer);
    const metadata = await image.metadata();
    console.log(metadata.width);
    console.log(metadata.height);
    // console.log(metadata);

    // Convertir una foto y png y moverla a carpeta indicada
    // await image.toFormat("png").toFile("./img-mod/photo2.png");
    //await fs.unlink(path.join(__dirname, photo));

    await sharp(photoBuffer).resize(300, 200).toFile("./img-mod/photo2.jpg");

    await sharp(photoBuffer)
      .composite([
        {
          input: "./hackaboss.png",
          gravity: "southeast",
        },
      ])
      .toFile("./img-mod/marca-agua.jpg");
  } catch (err) {
    console.log(err.message);
  }
}

main("./foto.jpg");
