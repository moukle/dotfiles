#!/bin/sh
while : ; do
	mpc idle
	song=$(mpc current)
	strlng=${#song}
	out=$(($strlng * 7))
	notify-send -r 115 "$(mpc current)" #-y 1050opup.sh -e "$(mpc current)" -w $out #-y 1050
done
