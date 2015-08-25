console.log("entry2だよ！")
var lib = require("../lib/somelib")
lib()
standalone() // excludeされる。window.standaloneにstandaloneオプションで作ったやつがいる