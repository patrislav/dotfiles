#!/bin/bash

UC1=$(checkupdates | wc -l)
UC2=$(checkupdates-aur | wc -l)
UC=$(( UC1 + UC2 ))

if (( UC > 0 ))
then
		echo " $UC \",\"color\": \"#FFFE6A"
else
		echo " $UC \",\"color\": \"#909090"
fi
