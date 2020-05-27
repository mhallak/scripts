#!/bin/sh
raspivid -t 0 -w 640 -h 480 -fps 48 -b 2000000 -awb tungsten  &

#raspivid -t 0 -w 640 -h 480 -fps 48 -b 2000000 -awb tungsten  -o - | gst-launch-1.0 -v fdsrc ! h264parse ! rtph264pay config-interval=1 pt=96 ! gdppay ! tcpserversink host=0.0.0.0 port=5000 &
GSTPID=$!

sleep 10
kill -9 $GSTPID
exit
