#! /bin/sh
# colcon build --packages-select cpp_pubsub  --event-handlers console_direct+
# Synopsis $0 <pkg>
# 
# 

pkg=$1
if [ -z "$1" ]
  then
    echo "No package"
    exit 1
fi

colcon build --packages-select $pkg  --event-handlers console_direct+

