#!/bin/sh
xset b off #beep
xsetroot -cursor_name left_ptr

HOSTNAME = $HOST
if [[ $HOSTNAME = "moe" ]]; then
	setxkbmap us altgr-intl nodeadkeys
	xrandr \
		--output DP-4 --mode 1920x1080 --rate 144.00 --rotate right \
		--output DP-2 --mode 1920x1080 --rate 144.00 --left-of DP-4 --primary \
		--output DP-2 --pos 0x440
else
	xset -b
	xset b 0 0 0 0
	setxkbmap de nodeadkeys
	setxkbmap -option caps:none
	xmodmap -e 'clear Lock' -e 'keycode 0x42 = Escape'
	xrandr --output eDPI1 --dpi 120
fi

squash material
nitrogen --restore &

xrdb ~/.Xresources
xset +fp ~/.fonts
xset fp rehash

flameshot        &
redshift         &
numlockx         &
dunst            &
greenclip daemon &
# compton          &
# urxvtd           &

exec bspwm
# exec dwm
