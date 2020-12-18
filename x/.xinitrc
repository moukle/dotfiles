#! /bin/sh

xsetroot -cursor_name left_ptr

xset -b          # disable beep
xset s 7200 7200 # screensaver after 60*120seconds
xset dpms 0 0 0  # disable display powermngt

# font stuff
xset fp rehash
xrdb ~/.Xresources

# scrollspeed - restrict to buttons 4&5
imwheel -b 45

if [[ $HOSTNAME = "olo" ]]; then
	setxkbmap us altgr-intl nodeadkeys
	numlockx
	# render: dpi = 192 # fuck gtk
	# 4k:     dpi = 138
	# 1080p:  dpi = 100
	xrandr --dpi 192x192 \
		--output DP-2 --mode 3840x2160 --primary --scale 1.39x1.39 \
		--output DP-4 --mode 1920x1080 --rate 144 --scale 1.92x1.92 --pos 5338x464 # --right-of DP-2


	# xrandr --dpi 140 --fb 6528x2160 \
	# 	--output DP-2   --mode 3840x2160 --primary --panning 3840x2160+0+0 \
	# 	--output DP-4   --mode 1920x1080 --rate 144 --scale 1.4x1.4 --pos 0x324 --panning 2688x1512+3840+324
	# 	# --output DP-4   --mode 3840x2160 --panning 3840x2160+2688+0 \
	# 	# --output DP-0   --scale 1.4x1.4 --mode 1920x1080 --rate 144 --pos 0x324 --panning 2688x1512+0+324
	# xrandr --dpi 138 \
	# 	--output DP-2   --mode 3840x2160 --primary \
	# 	--output DP-4   --mode 1920x1080 --scale 1x1 --rate 144 --pos 3840x540
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

# squash -dqs paper
# squash -dqs base16_tomorrow_night
# squash -dqs base16_mocha_edit
# squash   -dqs  base16_eighties

redshift 51:10 &
# picom --config $HOME/.config/picom/picom.conf &

# exec awesome >> ~/.cache/awesome/stdout 2>> ~/.cache/awesome/stderr
exec bspwm
# export XDG_SESSION_TYPE=x11
# export GDK_BACKEND=x11
# exec gnome-session
