#!/bin/bash
#img="scrot-$(date "+%y%m%d")-$RANDOM.png"
#dir="$HOME/Media/scrots/"

#scrot -q 100 "$img" -e "mv $img $dir"
#p.sh -e "... taking screenshot" -w 250


scr_dir="$HOME/Media/scrots"
mkdir -p "$scr_dir" || { printf "%s\n" "Error: Couldn't create screenshot directory"; exit; }

# Put screenshot in current date folder.
date="$(date +%F)"
mkdir -p "${scr_dir}/${date}"

# Name the screenshot
scr="${scr_dir}/${date}/$(date +%F-%I-%M-%S).png"

# Send the notification
notify-send -r 114 "Saved screenshot as ${scr/*\/}"

# Take the screenshot
import -window root "$scr"

