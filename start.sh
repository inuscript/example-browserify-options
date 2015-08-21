#!/bin/bash -v
PATH="./node_modules/.bin":$PATH
browserify -e ./src/entry1.js | js-beautify -f - > build/default.js
browserify -e ./src/entry1.js -u ./lib/*.js | js-beautify -f - > build/exclude.js
browserify -e ./src/entry1.js -x ./lib/*.js | js-beautify -f - > build/external.js
browserify -r ./lib/*.js | js-beautify -f - > build/require.js
browserify -s ./lib/some-lib.js | js-beautify -f - >  build/standalone.js
