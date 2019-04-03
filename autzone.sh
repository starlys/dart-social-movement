#!/bin/sh
if [ $1 = "start" ]; then
  echo "starting; to confirm everything started, say: ps -ef|grep dart ; or say: cat bootlog.txt"
  pkill -f supervisor.dart
  sleep 1
  dart supervisor.dart.snapshot > bootlog.txt 2> booterr.txt &
fi
if [ $1 = "restart" ]; then
  echo "restarting"
  echo "!" > status/restart.txt
fi
if [ $1 = "perish" ]; then
  echo "ending (gracefully); to confirm everything ended, say: ps -ef|grep dart"
  echo "!" > status/perish.txt
fi
if [ $1 = "kill" ]; then
  echo "killing worker and api process"
  pkill -f api.dart
  pkill -f worker.dart
  rm status/api_alive.txt
  rm status/worker_alive.txt
fi
if [ $1 = "killall" ]; then
  echo "killing all processes including supervisor"
  pkill -f supervisor.dart
  pkill -f api.dart
  pkill -f worker.dart
  rm status/api_alive.txt
  rm status/worker_alive.txt
fi
if [ $1 = "linuxprep" ]; then
  echo "preparing deployment; this command is only meant to be run on the linux server after uploading deploy folder"
  cd autzone_api
  /usr/lib/dart/bin/pub get --no-precompile
  cd ..
  cd autzone_common
  /usr/lib/dart/bin/pub get --no-precompile
  cd ..
  cd autzone_worker
  /usr/lib/dart/bin/pub get --no-precompile
  cd ..
  cd autzone_sendmail
  /usr/lib/dart/bin/pub get --no-precompile
  cd ..
fi
