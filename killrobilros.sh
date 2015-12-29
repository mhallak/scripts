#!/bin/bash

if [ "$(ps -ef | grep -i ros | grep -v grep | grep -v killrobilros.sh | awk '{print $2}')" ]; then # or $(rosnode list)
    for i in $(ps -ef | grep -i ros | grep -v grep | grep -v killrobilros.sh | awk '{print $2}')
    do
        kill -9 $i;
        echo "Killing " $i "...killed";
    done
fi
