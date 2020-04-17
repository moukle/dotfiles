#!/usr/bin/env bash

# You can call this script like this:
# $ ./volumeControl.sh up
# $ ./volumeControl.sh down
# $ ./volumeControl.sh mute

# Script modified from these wonderful people:
# https://github.com/dastorm/volume-notification-dunst/blob/master/volume.sh
# https://gist.github.com/sebastiencs/5d7227f388d93374cebdf72e783fbd6a

function get_volume {
	# amixer get Master | grep '%' | head -n 1 | cut -d '[' -f 2 | cut -d '%' -f 1
	pamixer --get-volume
}

function is_mute {
	# amixer get Master | grep '%' | grep -oE '[^ ]+$' | grep off > /dev/null
	pamixer --get-mute
}

function send_notification {
	iconSound="audio-volume-high-symbolic"
	iconMuted="audio-volume-muted-symbolic"
	if is_mute ; then
		dunstify -i $iconMuted -r 2593 -u normal "mute"
	else
		volume=$(get_volume)
		# Make the bar with the special character ─ (it's not dash -)
		# https://en.wikipedia.org/wiki/Box-drawing_character
		bar=$(seq --separator="─" 0 "$((volume / 5))" | sed 's/[0-9]//g')
		# Send the notification
		dunstify -i $iconSound -r 2593 -u normal "    $bar"
	fi
}

case $1 in
	up)
		# set the volume on (if it was muted)
		pamixer -u
		# up the volume (+ 5%)
		pamixer -i 5
		send_notification
		;;
	down)
		pamixer -u
		pamixer -d 5
		send_notification
		;;
	mute)
		# toggle mute
		# amixer -D pulse set Master 1+ toggle > /dev/null
		pamixer -t
		send_notification
		;;
esac
