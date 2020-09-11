rem script prepares autzone for release on development Windows box

rem client:

rem compile dart files to js and put them in public_html; also
rem copies styles and graphics to public_html
echo building client javascript from dart
cd \dev\autzone\autzone_client
call webdev build 

cd ..
echo Copying files from autzone_client/web to deploy
rmdir /S /Q deploy
mkdir deploy
mkdir deploy\status
mkdir deploy\public_html
mkdir deploy\public_html\images
mkdir deploy\public_html\styles
mkdir deploy\public_html\js
mkdir deploy\public_html\site_AUT
copy autzone_client\web\index.html deploy\public_html
copy autzone_client\web\images\* deploy\public_html\images
copy autzone_client\web\styles\* deploy\public_html\styles
copy autzone_client\web\js\* deploy\public_html\js
copy autzone_client\build\main.dart.js deploy\public_html
copy autzone_client\web\site_AUT\* deploy\public_html\site_AUT

rem server:

rem make snapshots; results go in same folder as the top level script for each executable
rem echo Building server snapshots (doesn't work on windows)
rem dart --snapshot=autzone_api\bin\autzone_api.dart.snapshot autzone_api\bin\autzone_api.dart
rem dart --snapshot=autzone_worker\bin\autzone_worker.dart.snapshot autzone_worker\bin\autzone_worker.dart
rem dart --snapshot=autzone_sendmail\bin\autzone_sendmail.dart.snapshot autzone_sendmail\bin\autzone_sendmail.dart
rem dart --snapshot=supervisor.dart.snapshot supervisor.dart

rem copy server files to deply
echo Copying server files to deploy
copy supervisor.dart deploy
copy prod_winprep.bat deploy
copy prod_perish.bat deploy
copy prod_restart.bat deploy

mkdir deploy\autzone_models
mkdir deploy\autzone_models\lib
mkdir deploy\autzone_models\lib\src
mkdir deploy\autzone_models\lib\src\models
copy autzone_models\pubspec.yaml deploy\autzone_models
copy autzone_models\lib\*.dart deploy\autzone_models\lib
copy autzone_models\lib\src\*.dart deploy\autzone_models\lib\src
copy autzone_models\lib\src\models\*.dart deploy\autzone_models\lib\src\models

mkdir deploy\autzone_common
mkdir deploy\autzone_common\lib
mkdir deploy\autzone_common\lib\src
mkdir deploy\autzone_common\lib\src\amazon
copy autzone_common\pubspec.yaml deploy\autzone_common
copy autzone_common\lib\*.dart deploy\autzone_common\lib
copy autzone_common\lib\src\*.dart deploy\autzone_common\lib\src
copy autzone_common\lib\src\amazon\*.dart deploy\autzone_common\lib\src\amazon

mkdir deploy\autzone_api
mkdir deploy\autzone_api\bin
mkdir deploy\autzone_api\lib
mkdir deploy\autzone_api\lib\src
copy autzone_api\pubspec.yaml deploy\autzone_api
copy autzone_api\bin\autzone_api.dart deploy\autzone_api\bin
copy autzone_api\lib\src\*.dart deploy\autzone_api\lib\src

mkdir deploy\autzone_worker
mkdir deploy\autzone_worker\bin
mkdir deploy\autzone_worker\lib
mkdir deploy\autzone_worker\lib\src
copy autzone_worker\pubspec.yaml deploy\autzone_worker
copy autzone_worker\bin\autzone_worker.dart deploy\autzone_worker\bin
copy autzone_worker\lib\*.dart deploy\autzone_worker\lib
copy autzone_worker\lib\src\*.dart deploy\autzone_worker\lib\src

mkdir deploy\autzone_sendmail
mkdir deploy\autzone_sendmail\bin
copy autzone_sendmail\pubspec.yaml deploy\autzone_sendmail
copy autzone_sendmail\bin\autzone_sendmail.dart deploy\autzone_sendmail\bin

mkdir deploy\config
copy config\config.yaml deploy\config
echo "Reminder: set dev=N in config.yaml"

pause
