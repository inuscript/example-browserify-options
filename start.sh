#!/bin/bash -v
PATH="./node_modules/.bin":$PATH
rm -rf build
mkdir build
browserify -e ./src/entry1.js | js-beautify -f - > build/default.js

browserify -r ./lib/somelib.js | js-beautify -f - > build/require.js
browserify -e ./src/entry1.js -x ./lib/**/*.js | js-beautify -f - > build/require-entry.js

browserify -e ./src/entry2.js -u ./lib/exclusion.js | js-beautify -f - > build/exclude.js
browserify -e ./src/entry2.js -i ./lib/exclusion.js | js-beautify -f - > build/ignore.js
browserify -r ./lib/somelib.js -r ./lib/exclusion.js -i ./lib/exclusion.js | js-beautify -f - > build/require_ignore.js
browserify -s ./lib/somelib.js | js-beautify -f - >  build/standalone.js
browserify -e ./src/fs.js | js-beautify -f - >  build/fs.js

# error.
# browserify -r ./lib/*.js -u ./lib/exclusion.js | js-beautify -f - > build/require_exclude.js
