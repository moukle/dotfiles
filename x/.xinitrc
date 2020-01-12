#! /bin/sh

xsetroot -cursor_name left_ptr
xset -b
xset +fp ~/.fonts
xset fp rehash
xrdb ~/.Xresources

if [[ $HOSTNAME = "olo" ]]; then
	setxkbmap us altgr-intl nodeadkeys
	xrandr --output DP-4 --mode 1920x1080 --rate 144.00 # --rotate right
	xrandr --output DP-2 --mode 1920x1080 --rate 144.00 --left-of DP-4 --primary
	# xrandr --output DP-2 --pos 0x380
else
	setxkbmap de nodeadkeys
	setxkbmap -option caps:none
	xmodmap -e 'clear Lock' -e 'keycode 0x42 = Escape'
	xrandr --output eDPI1 --dpi 120
fi

# start some nice programs
if [ -d /etc/X11/xinit/xinitrc.d ] ; then
	for f in /etc/X11/xinit/xinitrc.d/?*.sh ; do
		[ -x "$f" ] && . "$f"
	done
	unset f
fi

nitrogen  --restore &
squash    base16_tomorrow_night
greenclip daemon &
# picom --config ~/.config/compton/compton.conf &
numlockx  &
# blockify  &
flameshot &
redshift  51:10 &
dunst     &

# greenclip daemon &
# compton

exec bspwm
