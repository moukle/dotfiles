#! /bin/sh

xsetroot -cursor_name left_ptr

xset -b            # disable beep
xset s 7200 7200   # screensaver after 60*120seconds
xset dpms 0 0 0    # disable display powermngt
xset fp rehash     # font stuff

xrdb ~/.Xresources # X settings
.x/keyboard.sh     # keyboard settings
# .x/xrandr.sh	   # display settings
.x/xrandr.sh game       # display settings
# autorandr --load main

# start some nice programs
for f in /etc/X11/xinit/xinitrc.d/?*.sh ; do
	[ -x "$f" ] && . "$f"
done; f=

redshift -l 51:10 > /dev/null & # blue filter
dunst                      & # notifications
nitrogen --restore         & # wallpaper
imwheel -b 45              &

picom & # compositor
# picom --experimental-backends &

exec bspwm

# export XDG_SESSION_TYPE=x11
# export GDK_BACKEND=x11
# exec gnome-session
