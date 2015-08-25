console.log("entry2だよ！")
var lib = require("../lib/somelib")
var standalone = require("standalone")
lib()
standalone() // excludeされる。window.standaloneにstandaloneオプションで作ったやつがいる