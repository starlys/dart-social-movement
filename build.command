#!/bin/sh

#script compiles dart files to js and puts them in public_html; also
#copies styles and graphics
cd /Users/star/autzone/client
webdev build 
cd ..
echo Copying files from client/web to public_html
cp client/web/index.html public_html
cp client/web/images/* public_html/images
cp client/web/styles/* public_html/styles
cp client/web/js/* public_html/js
cp client/build/main.dart.js public_html