#!/bin/sh
# 
echo "Display time spent by a process in user and kernel as well as time waited for children"

arg1=$1
if [ -z "$1" ]
  then
    echo "Insert process id"
    echo "$0 <pid>"
    exit 1
fi

perl -MPOSIX -l -0777 -ne '@f = /\(.*\)|\S+/gs;
    printf "utime: %.2f\nstime: %.2f\ncutime: %.2f\ncstime: %.2f\n",
      map {$_/POSIX::sysconf( &POSIX::_SC_CLK_TCK )}@f[13..16]' "/proc/$arg1/stat"
