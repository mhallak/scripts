#! /bin/sh
# assign gazebo master to another computer (or not)
# Synopsis set_gazb_master.sh [ip or host] 
# 
# 

arg1=$1
arg2=$2
if [ -z "$1" ]
  then
    echo "No host or ip."
    exit 1
fi

export GAZEBO_MASTER_URI="http://$arg1:11345"

echo "Setting GAZEBO_MASTER_URI to $GAZEBO_MASTER_URI"

# PROMPT_COMMAND='echo -ne "\033]0; ${PWD##*/}${ROS_MASTER_URI}\007"'

#echo -ne "\033]0;$(basename ${PWD})${ROS_MASTER_URI}\007"
