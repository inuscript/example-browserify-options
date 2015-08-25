console.log("This is entry1")
var lib = require("../lib/somelib")
var ex = require("../lib/exclusion")
lib()
ex()

var baz = "vr" // baz === undefined
window.hoge = "baz" // hoge === "baz"
foo = "zoo" // foo === "zoo" VERY BAD PATTERN

