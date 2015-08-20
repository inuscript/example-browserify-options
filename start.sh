#!/bin/bash -v
PATH="~/node_modules/.bin":$PATH
browserify -e ./src/entry1.js > build/default.js
browserify -e ./src/entry1.js -u ./lib/*.js > build/exclude.js
browserify -e ./src/entry1.js -x ./lib/*.js > build/external.js
browserify -r ./lib/*.js > build/require.js
browserify -s ./lib/*.js > build/standalone.js
