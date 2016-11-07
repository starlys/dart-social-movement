#!/bin/sh
if [ $1 = "start" ]; then
  echo "starting in production mode"
  #pkill -f api.dart
  #pkill -f worker.dart
  pkill -f supervisor.dart
  sleep 1
  dart supervisor.dart
fi
if [ $1 = "dev" ]; then
  echo "starting in dev mode"
  pkill -f api.dart
  pkill -f worker.dart
  pkill -f supervisor.dart
  sleep 1
  dart supervisor.dart dev
fi
if [ $1 = "restart" ]; then
  echo "restarting"
  echo "!" > restart.txt
fi
if [ $1 = "kill" ]; then
  echo "killing worker and api process"
  pkill -f api.dart
  pkill -f worker.dart
  rm api_alive.txt
  rm worker_alive.txt
fi
if [ $1 = "killall" ]; then
  echo "killing all processes including supervisor"
  pkill -f supervisor.dart
  pkill -f api.dart
  pkill -f worker.dart
  rm api_alive.txt
  rm worker_alive.txt
fi
