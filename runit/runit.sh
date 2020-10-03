#!/bin/bash/
sleepTime=$(($RANDOM % 10))
sleep $sleepTime
echo "$(date) - alive" >> ~/scripts/git_scripts/pje-f-raspberry-pi-4b/logs/workload.log
