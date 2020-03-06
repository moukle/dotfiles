#! /bin/sh

xsetroot -cursor_name left_ptr
xset +b
xset +fp ~/.fonts
xset fp rehash
xrdb ~/.Xresources

if [[ $HOSTNAME = "olo" ]]; then
	setxkbmap us altgr-intl nodeadkeys
	xrandr --dpi 140 --fb 8040x2688 \
		--output DP-0   --mode 3840x2160 --panning 3840x2160+2688+210 \
		--output DP-4   --scale 1.4x1.4 --mode 1920x1080 --rate 144 --pos 0x534 --panning 2688x1512+0+534 \
		--output DP-2   --scale 1.4x1.4 --mode 1920x1080 --rate 144 --pos 6528x0 --panning 1512x2688+6528+0 --rotate left
	# xrandr --fb 9840x3840 \
	# 	--output DP-0   --mode 3840x2160 --panning 3840x2160+3840+0 \
	# 	--output DP-4   --scale 2x2 --mode 1920x1080 --rate 144 --pos 0x0 --panning 3840x2160+0+0 \
	# 	--output DP-2   --scale 2x2 --mode 1920x1080 --rate 144 --pos 7680x0 --panning 2160x3840+7680+0 --rotate left
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
# squash    gruvbox
squash    base16_mocha
# squash    ayu_light
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
