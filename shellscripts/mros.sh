#! /bin/sh
# assign rosmaster to another computer (or not)
# Synopsis mros.sh [ip or host] 
# 
# 

arg1=$1
if [ -z "$1" ]
  then
    echo "No host or ip."
    exit 1
fi

#export ROS_MASTER_URI=http://kfir:11311
export ROS_MASTER_URI=http://$arg1:11311
echo "Setting ROS_MASTER_URI to $ROS_MASTER_URI"

# PROMPT_COMMAND='echo -ne "\033]0; ${PWD##*/}${ROS_MASTER_URI}\007"'

#echo -ne "\033]0;$(basename ${PWD})${ROS_MASTER_URI}\007"
