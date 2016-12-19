#!/bin/bash

HELD=0 # set how many packages we're holding
PML=$(pacman -Sup | wc -l)
touch /tmp/udc
UC=$(( $PML - $HELD - 1))

if (( UC > 0 ))
then
		echo " $UC \",\"color\": \"#FFFE6A"
else
		echo " $UC \",\"color\": \"#909090"
fi
