#! /bin/bash

if [[ $HOSTNAME = "archlinux" ]]; then
    xrandr --dpi 138x138 \
        --output DP-2 --mode 3840x2160 --primary --scale 1.0x1.0 \
        --output DP-0 --mode 1920x1080 --rate 144 --left-of DP-2
else
    xrandr -q &> ${HOME}/.xinitrc.log # have to pull this first, idk why
    xrandr --dpi 93x93 \
        --output eDP1 --mode 1920x1080 \
        --output HDMI2 --mode 2560x1440 --left-of eDP1 --primary
fi
