#!/bin/sh

if [[ $hostname = "void" ]]; then
	setxkbmap us altgr-intl nodeadkeys
	numlockx
else
	setxkbmap de nodeadkeys
	# setxkbmap us altgr-intl nodeadkeys
	setxkbmap -option caps:none
	xmodmap -e 'clear Lock' -e 'keycode 0x42 = Escape'
	numlockx
fi
