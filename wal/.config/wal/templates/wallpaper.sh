#! /bin/bash

wallpaper_path="$HOME/media/walls/{wallpaper}"

if test -f "$wallpaper_path"; then
    hsetroot -cover $wallpaper_path >> /dev/null
else
    hsetroot -solid "{color8}" >> /dev/null
fi
