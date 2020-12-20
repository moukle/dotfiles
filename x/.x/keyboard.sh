#!/bin/sh

if [[ $HOSTNAME = "olo" ]]; then
	setxkbmap us altgr-intl nodeadkeys
	numlockx
else
	setxkbmap de nodeadkeys
	setxkbmap -option caps:none
	xmodmap -e 'clear Lock' -e 'keycode 0x42 = Escape'
fi
