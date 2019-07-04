#!/bin/sh
source ~/.bin/scripts/pacmdstat
notify-send -r 117 "volume: $(getdefaultsinkvol)%"
