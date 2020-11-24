#!/bin/bash
load=$1
drt=$2
if [ -z "$2"] ;then
    echo "no duration"
    dt="-l $load"
else
    dt="-l $load -d $drt"
fi
echo "$dt"
echo load=$load and duration=$drt

./CPULoadGenerator.py -c 0  $dt | ./CPULoadGenerator.py -c 1 $dt | ./CPULoadGenerator.py -c 2 $dt | ./CPULoadGenerator.py -c 3 $dt | ./CPULoadGenerator.py -c 4 $dt |./CPULoadGenerator.py -c 5 $dt &



