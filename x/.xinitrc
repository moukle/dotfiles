#! /bin/sh

xsetroot -cursor_name left_ptr
xset -b
xset +fp ~/.fonts
xset fp rehash
xrdb ~/.Xresources

if [[ $HOSTNAME = "olo" ]]; then
	setxkbmap us altgr-intl nodeadkeys
	numlockx
	xrandr --dpi 140 --fb 6528x2160 \
		--output DP-0   --mode 3840x2160 --panning 3840x2160+2688+0 \
		--output DP-4   --scale 1.4x1.4 --mode 1920x1080 --rate 144 --pos 0x324 --panning 2688x1512+0+324
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
squash    -qs paper
flameshot &
redshift  51:10 &
dunst     &

exec bspwm
