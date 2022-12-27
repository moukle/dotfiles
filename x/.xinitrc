#! /bin/sh

# x
xsetroot -cursor_name left_ptr  # remove ugly X
xset s 7200 7200                # screensaver after 60*120seconds
.x/xrandr.sh                    # display settings
.x/keyboard.sh                  # keyboard settings

redshift -l 51:10 > /dev/null & # blue filter

# start some nice programs
for f in /etc/X11/xinit/xinitrc.d/?*.sh ; do
	[ -x "$f" ] && . "$f"
done; f=

# audio
# pipewire &
# pipewire-pulse &

# export $(dbus-launch)

exec bspwm
