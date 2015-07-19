#!/bin/sh

if [ -z ${PORT} ]
then
  echo "Starting on default port: 57575"
  /home/terminal/app/butterfly.server.py --unsecure --host=0.0.0.0
else
  echo "Starting on port: ${PORT}"
  /home/terminal/app/butterfly.server.py --unsecure --host=0.0.0.0 --port=${PORT}
fi
