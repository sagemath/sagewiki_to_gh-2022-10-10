#!/bin/sh


MODELINE="74.250 1280 1390 1430 1650 720 725 730 750 +HSync +VSync"

xrandr --newmode 1280x720 $MODELINE
xrandr --addmode VGA-1 1280x720
xrandr --addmode LVDS-1 1280x720

