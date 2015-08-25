#!/bin/bash -v
PATH="./node_modules/.bin":$PATH
rm -rf build
mkdir build

# entry
browserify ./src/entry.js | js-beautify -f - > build/no-entry.js
browserify -e ./src/entry.js | js-beautify -f - > build/default.js
browserify -e ./src/entry.js -e ./src/entry3.js | js-beautify -f - > build/multi-entry.js

# require & external
browserify -r ./lib/somelib.js | js-beautify -f - > build/require.js
browserify -e ./src/entry.js -x ./lib/**/*.js | js-beautify -f - > build/entry-require.js

# standalone & exclude
browserify -e ./src/entry-exclude-standalone.js -u standalone | js-beautify -f - > build/entry-exclude.js
browserify ./lib/standalone.js --standalone standalone | js-beautify -f - >  build/standalone.js
# browserify -e ./src/entry-exclude-standalone.js  | js-beautify -f - > build/entry-exclude-err.js

# ignore
browserify -e ./src/entry.js -i ./lib/somelib.js | js-beautify -f - > build/ignore.js
browserify -e ./src/ignore.js -i iconv | js-beautify -f - >  build/fs.js

# exclude2
browserify -r jquery -s jquery > build/jquery-bundle.js
# browserify -r ./lib/somelib.js -x jquery　| js-beautify -f - > build/require-bundle.js
browserify ./src/entry-jquery.js -x jquery | js-beautify -f - > build/entry-jquery.js

# error.
# browserify -r ./lib/*.js -u ./lib/exclusion.js | js-beautify -f - > build/require_exclude.js
