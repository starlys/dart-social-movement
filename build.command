#!/bin/sh

#script prepares autzone for release on development Mac

#client:

#compile dart files to js and put them in public_html; also
#copies styles and graphics to public_html
echo building client javascript from dart
cd /Users/star/autzone/autzone_client
webdev build 
cd ..
echo Copying files from autzone_client/web to deploy
rm -rf deploy
mkdir deploy
mkdir deploy/status
mkdir deploy/public_html
mkdir deploy/public_html/images
mkdir deploy/public_html/styles
mkdir deploy/public_html/js
mkdir deploy/public_html/site_AUT
cp autzone_client/web/index.html deploy/public_html
cp autzone_client/web/images/* deploy/public_html/images
cp autzone_client/web/styles/* deploy/public_html/styles
cp autzone_client/web/js/* deploy/public_html/js
cp autzone_client/build/main.dart.js deploy/public_html
cp autzone_client/web/site_AUT/* deploy/public_html/site_AUT

#server:

#make snapshots; results go in same folder as the top level script for each executable
echo Building server snapshots
dart --snapshot=autzone_api/bin/autzone_api.dart.snapshot autzone_api/bin/autzone_api.dart
dart --snapshot=autzone_worker/bin/autzone_worker.dart.snapshot autzone_worker/bin/autzone_worker.dart
dart --snapshot=autzone_sendmail/bin/autzone_sendmail.dart.snapshot autzone_sendmail/bin/autzone_sendmail.dart
dart --snapshot=supervisor.dart.snapshot supervisor.dart

#copy server files to deply
echo Copying server files to deploy
cp supervisor.dart.snapshot deploy
cp autzone.sh deploy
mkdir deploy/autzone_models
cp autzone_models/pubspec.yaml deploy/autzone_models
mkdir deploy/autzone_common
cp autzone_common/pubspec.yaml deploy/autzone_common
mkdir deploy/autzone_api
mkdir deploy/autzone_api/bin
cp autzone_api/pubspec.yaml deploy/autzone_api
cp autzone_api/bin/autzone_api.dart.snapshot deploy/autzone_api/bin
mkdir deploy/autzone_worker
mkdir deploy/autzone_worker/bin
cp autzone_worker/pubspec.yaml deploy/autzone_worker
cp autzone_worker/bin/autzone_worker.dart.snapshot deploy/autzone_worker/bin
mkdir deploy/autzone_sendmail
mkdir deploy/autzone_sendmail/bin
cp autzone_sendmail/pubspec.yaml deploy/autzone_sendmail
cp autzone_sendmail/bin/autzone_sendmail.dart.snapshot deploy/autzone_sendmail/bin
mkdir deploy/config
cp config/config.yaml deploy/config
echo "Reminder: set dev=N in config.yaml"