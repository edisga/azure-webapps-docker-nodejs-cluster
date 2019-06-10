#!/bin/sh
set -e
service ssh start
#node /data/server.js > stdout.log 2> stderror.log

#echo "Copying files to /home/site/wwwroot"
#mv /data/* /home/site/wwwroot/ 
#echo "============LS==============="
ls  /home/site/wwwroot/
#echo "============================="
echo "Running nodejs"
cd /home/site/wwwroot/
node server.js > stdout.log 2> stderror.log