#!/bin/bash
if [ "$(ps -ef | grep CPUL | grep -v grep | awk '{print $2}')" ]; then
    for i in $(ps -ef | grep CPUL | grep -v grep | awk ' { print $2}')
    do
        kill -9 $i;
        echo "Killing CPULoad" $i " ... Killed";
    done
fi

if [ "$(ps -ef | grep Mandelbrot | grep -v grep | awk '{print $2}')" ]; then
    for i in $(ps -ef | grep Mandelbrot | grep -v grep | awk ' { print $2}')
    do
        kill -9 $i;
        echo "Killing Mandelbrot" $i " ... Killed";
    done
fi