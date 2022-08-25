#! /bin/bash

if [[ $HOSTNAME = "toaster" ]]; then
    if [[ $1 = "game" ]]; then
        xrandr --dpi 100x100 \
            --output DP-0 --off \
            --output DP-2 --mode 1920x1080 --rate 144
        setxkbmap de nodeadkeys # use red-switches keyboard (which is de)
    elif [[ $1 = "dual" ]]; then
        xrandr --dpi 138x138 \
            --output DP-0 --mode 3840x2160 --primary --scale 1.0x1.0 \
            --output DP-2 --mode 1920x1080 --rate 144 --right-of DP-0
    else
        xrandr --dpi 138x138 \
            --output DP-0 --mode 3840x2160 --primary --scale 1.0x1.0 \
            --output DP-2 --off
    fi
else
    xrandr -q &> ${HOME}/.xinitrc.log # have to pull this first, idk why
    xrandr --dpi 93x93 \
        --output eDP1 --mode 1920x1080 \
        --output HDMI2 --mode 2560x1440 --left-of eDP1 --primary
fi
        # --output HDMI2 --mode 3840x2160 --left-of eDP1 --primary
