#!/bin/bash/
sleepTime=$(($RANDOM % 10))
sleep $sleepTime
echo "$(date) - alive" >> ../logs/workload.log
