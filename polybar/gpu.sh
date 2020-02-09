#!/bin/bash

GPU_CONTROL_PATH=/sys/bus/pci/devices/0000:02:00.0/power/control

case $1 in
  print)
    cpu_control=$( cat $GPU_CONTROL_PATH )
    if [ "$cpu_control" = "on" ]; then
      echo "%{F#FFFE6A}GPU on%{F-}"
    else
      echo "%{F#909090}GPU off%{F-}"
    fi
    ;;

esac


