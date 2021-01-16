const fs = require("fs");

const logger = fs.appendFile("message.txt", "data to append", function (err) {
  if (err) throw err;
  console.log("Saved!");
});

module.exports = {
  logger,
};
