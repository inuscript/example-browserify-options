#!/bin/bash -v
PATH="./node_modules/.bin":$PATH
browserify -e ./src/entry1.js | js-beautify -f - > build/default.js
browserify -e ./src/entry2.js -u ./lib/exclusion.js | js-beautify -f - > build/exclude.js
browserify -e ./src/entry2.js -x ./lib/**/*.js | js-beautify -f - > build/external.js
browserify -e ./src/entry2.js -i ./lib/exclusion.js | js-beautify -f - > build/ignore.js
browserify -r ./lib/somelib.js -r ./lib/exclusion.js | js-beautify -f - > build/require.js
browserify -r ./lib/somelib.js -r ./lib/exclusion.js -i ./lib/exclusion.js | js-beautify -f - > build/require_ignore.js
browserify -s ./lib/some-lib.js | js-beautify -f - >  build/standalone.js

# error.
# browserify -r ./lib/*.js -u ./lib/exclusion.js | js-beautify -f - > build/require_exclude.js
