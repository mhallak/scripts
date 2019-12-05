#!/bin/sh

gst-launch-1.0 -v v4l2src device=/dev/video3 ! video/x-raw,format=UYVY,interlace-mode=interleaved ! videoconvert ! xvimagesink &
GSTPID=$!

sleep 10
kill -9 $GSTPID
exit
