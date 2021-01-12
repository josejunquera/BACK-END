const path = require("path");

console.log(path.join("/foo", "bar", "asdada"));

console.log(path.resolve("/foo/bar", "./baz"));

console.log(path.resolve("/foo/bar", "/tmp/file/"));
