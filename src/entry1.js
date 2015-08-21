console.log("This is entry1")
var lib = require("../lib/some-lib")

lib()

var baz = "vr" // baz === undefined
window.hoge = "baz" // hoge === "baz"
foo = "zoo" // foo === "zoo" VERY BAD PATTERN
