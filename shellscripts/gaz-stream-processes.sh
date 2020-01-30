#!/bin/sh

echo "ps -ef | grep gz;"
ps -ef | grep gz;
sleep 1
echo "ps -ef | grep gaz;"
ps -ef | grep gaz;
sleep 1
echo "ipcs | grep 0x000020d;"
ipcs | grep 0x000020d;
sleep 1
echo "ls -l /dev/shm/sem*;"
ls -l /dev/shm/sem*;

echo "That's all"

exit

