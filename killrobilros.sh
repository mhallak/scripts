#!/bin/bash

if [ "$(ps -ef | grep -i ros | grep -v grep | grep -v killrobilros.sh | grep -v chrome | awk '{print $2}')" ]; then # or $(rosnode list)
    for i in $(ps -ef | grep -i ros | grep -v grep | grep -v killrobilros.sh | grep -v chrome | awk '{print $2}')
    do
        kill -9 $i;
        echo "Killing " $i "...killed";
    done
fi
if [ "$(ps -ef | grep ocu | grep -v grep | awk '{print $2}')" ]; then # or $(rosnode list)
    for i in $(ps -ef | grep ocu | grep -v grep | awk '{print $2}')
    do
        kill -9 $i;
        echo "Killing OCU " $i "...killed";
    done
fi