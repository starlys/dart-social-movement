#!/bin/sh

#script compiles dart files to js and puts them in public_html; also
#copies styles and graphics
cd /Users/star/autzone
dart2js --out=public_html/main.dart.js client/main.dart
#dart2js --minify --out=public_html/main.dart.js client/main.dart
cp client/web/images/* public_html/images
cp client/web/styles/* public_html/styles
cp client/web/js/* public_html/js
