#!/bin/bash

MUTED=0

MUTED=`pacmd list-sinks 0 | grep muted | cut -d ' ' -f 2`
VOLPERC=`amixer get Master |grep % |awk '{print $5}'|sed 's/[^0-9]//g' |sed -n '1{p;q}'`
HEADPHONES=`pacmd list-sinks 0 | grep "active port" | cut -d ' ' -f 3`

if [ "$MUTED" = "yes" ]; then
    echo " 🔇"
else
    if [ "$HEADPHONES" = "<analog-output-headphones>" ]; then
        ICON="\xEF\x80\xA5" # fa-headphones
    else
        ICON="\xEF\x80\xA8" # fa-volume-up
    fi
    echo -e "${ICON} ${VOLPERC}%"
fi
