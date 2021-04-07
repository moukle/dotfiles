#! /bin/sh

xsetroot -cursor_name left_ptr

xset -b            # disable beep
xset s 7200 7200   # screensaver after 60*120seconds
xset dpms 0 0 0    # disable display powermngt
xset fp rehash     # font stuff

xrdb ~/.Xresources # X settings
.x/xrandr.sh       # display settings
.x/keyboard.sh     # keyboard settings

# start some nice programs
for f in /etc/X11/xinit/xinitrc.d/?*.sh ; do
	[ -x "$f" ] && . "$f"
done; f=

redshift 51:10 > /dev/null & # blue filter
dunst                      & # notifications
nitrogen --restore         & # wallpaper
picom --config $HOME/.config/picom/picom.conf & # compositor
imwheel -b 45

exec bspwm
