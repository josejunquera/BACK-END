"use strict";
const path = require("path");
const fs = require("fs").promises;
const argv = require("minimist")(process.argv.slice(2));

const main = async (pathName) => {
  try {
    const files = await fs.readdir(pathName);
    console.log("files", files);
  } catch (err) {
    console.log(err);
  }
};

main(argv.dir);

/* Ejecutar por consola  node index --dir "." 

Con un map sacar la info de cada archivo.(peso,directorio...)

*/
