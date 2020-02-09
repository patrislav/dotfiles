#/usr/bin/env bash
# based on https://github.com/meskarune/i3lock-fancy/blob/master/i3lock-fancy
set -o errexit -o noclobber -o nounset -o pipefail

hue=(-level "0%,100%,0.6")
effect=(-filter Gaussian -resize 20% -define "filter:sigma=1.5" -resize 500.5%)
image=$(mktemp --suffix=.png)

import -window root "$image"

convert "$image" -level "0%,100%,0.6" -filter Gaussian -resize 20% -define "filter:sigma=1.5" -resize 500.5% "$image"

# Doesn't show the image currently
feh -F "$image" &
pid=$!

rofi -show drun

kill $pid
