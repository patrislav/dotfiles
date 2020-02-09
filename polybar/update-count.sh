#!/bin/bash

UC1=$(checkupdates | wc -l)
UC2=$(checkupdates-aur | wc -l)
UC=$(( UC1 + UC2 ))

if (( UC > 0 ))
then
		echo "%{F#FFFE6A} $UC%{F-}"
else
		echo "%{F#909090} $UC%{F-}"
fi
