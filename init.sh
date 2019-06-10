#!/bin/sh
set -e
service ssh start
echo "Running nodejs"
node /data/server.js > stdout.log 2> stderror.log