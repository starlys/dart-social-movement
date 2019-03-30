#!/bin/sh
if [ $1 = "start" ]; then
  echo "starting in production mode"
  pkill -f supervisor.dart
  sleep 1
  dart supervisor.dart.snapshot
fi
if [ $1 = "restart" ]; then
  echo "restarting"
  echo "!" > status/restart.txt
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
