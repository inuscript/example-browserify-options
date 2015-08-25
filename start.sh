#!/bin/bash -v
PATH="./node_modules/.bin":$PATH
rm -rf build
mkdir build
browserify -e ./src/entry.js | js-beautify -f - > build/default.js

browserify -r ./lib/somelib.js | js-beautify -f - > build/require.js
browserify -e ./src/entry.js -x ./lib/**/*.js | js-beautify -f - > build/entry-require.js

browserify -e ./src/entry-exclude-standalone.js -u standalone | js-beautify -f - > build/entry-exclude.js
browserify ./lib/standalone.js --standalone standalone | js-beautify -f - >  build/standalone.js

# browserify -e ./src/entry2.js -i ./lib/exclusion.js | js-beautify -f - > build/ignore.js
browserify -r ./lib/somelib.js -r ./lib/exclusion.js -i ./lib/exclusion.js | js-beautify -f - > build/require_ignore.js
browserify -e ./src/fs.js | js-beautify -f - >  build/fs.js

browserify -r jquery -s jquery > build/jquery-bundle.js
browserify -e ./src/entry-jquery.js -x jquery | js-beautify -f - > build/entry-jquery.js

# error.
# browserify -r ./lib/*.js -u ./lib/exclusion.js | js-beautify -f - > build/require_exclude.js
