// const { hello, goodbye, count } = require("./helpers");

// hello();
// goodbye();
// console.log(count);

const helpers = require("./helpers");

console.log(`Valor de count ${helpers.count}`);

helpers.count = 140;

const aux = require("./aux");
