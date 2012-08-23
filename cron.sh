#!/bin/bash
# usage:
#   /usr/bin/bash cron.sh /home/node/.ssh/id_rsa_whatever
# run once per day to upload the previous day's logs

# exit on any errors
set -e

id=$1
scp -i $id ubuntu@npm.m.ic.ht:hosting/servers/isaacs/db/log.1 .

dir=$(dirname $0)
node $dir/upload.js log.1
