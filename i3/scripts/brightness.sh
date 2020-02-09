#!/bin/zsh
zmodload zsh/mathfunc

BACKLIGHT=/sys/class/backlight/intel_backlight
CURRENT_BRIGHTNESS=$( cat $BACKLIGHT/brightness )
MAX_BRIGHTNESS=$( cat $BACKLIGHT/max_brightness )

STEP_PERCENT=0.1
STEP_FLOAT=$(( $MAX_BRIGHTNESS*$STEP_PERCENT ))
STEP=$((int(rint($STEP_FLOAT))))

case $1 in
  up)
    NEW_BRIGHTNESS=$(( $CURRENT_BRIGHTNESS + $STEP ))
    if [ $NEW_BRIGHTNESS -gt $MAX_BRIGHTNESS ]
    then
      NEW_BRIGHTNESS=$MAX_BRIGHTNESS
    fi
    tee $BACKLIGHT/brightness <<< $NEW_BRIGHTNESS
    ;;

  down)
    NEW_BRIGHTNESS=$(( $CURRENT_BRIGHTNESS - $STEP ))
    if [ $NEW_BRIGHTNESS -lt 0 ]
    then
      NEW_BRIGHTNESS=0
    fi
    tee $BACKLIGHT/brightness <<< $NEW_BRIGHTNESS
    ;;

  print)
    BRIGHTNESS_PERCENT=$( printf %.0f $(echo "$CURRENT_BRIGHTNESS/$MAX_BRIGHTNESS*100" | bc -l) )
    echo "$BRIGHTNESS_PERCENT%"
    ;;
esac
