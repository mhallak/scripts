#!/bin/sh

gst-launch-1.0 v4l2src device=/dev/video1 ! videoconvert ! ximagesink &
GSTPID=$!

sleep 10
kill -9 $GSTPID
exit
