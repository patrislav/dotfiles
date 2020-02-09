#!/bin/zsh

device="ELAN1200:00 04F3:30B9 Touchpad"
enabled="Device Enabled"
state=$(xinput list-props $device | grep $enabled | cut -f3)
echo $state

if [ $state = 1 ]; then
  xinput --disable "$device"
else
  xinput --enable "$device"
fi
