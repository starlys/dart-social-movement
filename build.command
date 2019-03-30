#!/bin/sh

#script prepares autzone for release

#client:
#compile dart files to js and put them in public_html; also
#copies styles and graphics to public_html
cd /Users/star/autzone/autzone_client
webdev build 
cd ..
echo Copying files from autzone_client/web to public_html
cp autzone_client/web/index.html public_html
cp autzone_client/web/images/* public_html/images
cp autzone_client/web/styles/* public_html/styles
cp autzone_client/web/js/* public_html/js
cp autzone_client/build/main.dart.js public_html

#server:
#make snapshots; results go in same folder as the top level script for each executable
echo Building server snapshots
dart --snapshot=autzone_api/bin/autzone_api.dart.snapshot autzone_api/bin/autzone_api.dart
dart --snapshot=autzone_worker/bin/autzone_worker.dart.snapshot autzone_worker/bin/autzone_worker.dart
dart --snapshot=autzone_sendmail/bin/autzone_sendmail.dart.snapshot autzone_sendmail/bin/autzone_sendmail.dart
dart --snapshot=supervisor.dart.snapshot supervisor.dart