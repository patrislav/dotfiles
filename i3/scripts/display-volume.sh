#!/bin/bash

MUTED=0

MUTED=`pacmd list-sinks 0 | grep muted | cut -d ' ' -f 2|sed -n '2{p;q}'`
VOLPERC=`amixer get Master |grep % |awk '{print $5}'|sed 's/[^0-9]//g' |sed -n '1{p;q}'`
HEADPHONES="off"

if [ "$MUTED" = "yes" ]; then
    echo "🔇"
else
    if [ "$HEADPHONES" = "on" ]; then
        ICON="\xEF\x80\xA5" # fa-headphones
    else
        ICON="\xEF\x80\xA8" # fa-volume-up
    fi
    echo -e "${ICON} ${VOLPERC}%"
fi
