const { suma, multiplicacion, division } = require("./basicas/basicas.js");
const { areaTriangulo } = require("./avanzadas/areas.js");
const argv = require("minimist")(process.argv.slice(2));

console.log(argv);

// console.log(suma(argv.num1, argv.num2));
// console.log(multiplicacion(argv.num1, argv.num2));
// console.log(division(argv.num1, argv.num2));
// console.log(areaTriangulo(argv.base, argv.altura));

switch (argv.operacion) {
  case "suma":
    console.log(suma(argv.num1, argv.num2));
    break;
  case "multiplicacion":
    console.log(multiplicacion(argv.num1, argv.num2));
    break;
  case "division":
    console.log(division(argv.num1, argv.num2));
    break;
  case "areaTriangulo":
    console.log(areaTriangulo(argv.base, argv.altura));
    break;
  default:
    process.exit();
}
