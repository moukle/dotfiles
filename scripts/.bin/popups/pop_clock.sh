#!/bin/sh
#popup.sh -e "$(date "+%a %d %b %H:%M")" -w 200
notify-send -r 111 "$(date "+%a %d %b %H:%M")"
#FONT="bariol:size=14:bold"

#while :; do
	#echo "%{c}$(date "+%a %d %b %H:%M")%{c}"
	#sleep 1s
#done |

#lemonbar -g "150x25" -f "$FONT" -B "#09090d" -F "#353540"
