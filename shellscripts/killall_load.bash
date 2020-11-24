#!/bin/bash
if ["$(ps -ef | grep CPUL | awk '{print $2}')"]; then
    for i in $(ps -ef | grep CPUL | awk '{print $2}')
    do
        kill -9 $i;
        echo "Killing " $i " ... Killed";
    done
fi