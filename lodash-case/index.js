const _ = require("lodash");

const objeto = {
  a: 1,
  b: 2,
  c: 3,
};

const nuevoObjeto = _.pick(objeto, ["b", "c"]);

console.log(nuevoObjeto);

const { b, c } = objeto;

const nuevoObjeto2 = { b, c };

console.log(nuevoObjeto2);

const nuevoObjeto3 = _.omit(objeto, ["b", "c"]);

console.log(nuevoObjeto3);

const arrayNumeros = [1, 2, 3, 4, 2, 3, 1, 4];

const arrayLimpio = _.uniq(arrayNumeros);

console.log(arrayLimpio);
