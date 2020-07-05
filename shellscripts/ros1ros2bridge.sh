#!/bin/bash

source /home/robil/git/ws/devel/setup.bash
roscore&
source /opt/ros/eloquent/setup.bash

export ROS_MASTER_URI=http://localhost:11311

ros2 run ros1_bridge dynamic_bridge &
PS1="<R1R2Br>$PS1"
#gst-launch-1.0 -v v4l2src device=/dev/video3 ! video/x-raw,format=UYVY,interlace-mode=interleaved ! videoconvert ! xvimagesink &
#GSTPID=$!

#sleep 10
#kill -9 $GSTPID
#exit
