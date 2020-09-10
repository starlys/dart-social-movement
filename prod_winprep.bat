echo "preparing deployment; this command is only meant to be run on the Windows development machine in the deploy folder"
cd autzone_api
call pub get 
cd ..
cd autzone_common
call pub get 
cd ..
cd autzone_worker
call pub get 
cd ..
cd autzone_sendmail
call pub get 

pause