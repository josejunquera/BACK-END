const { multiplicacion, division } = require("../basicas/basicas.js");

const areaTriangulo = (base, altura) =>
  division(multiplicacion(base, altura), 2);

module.exports = {
  areaTriangulo,
};
