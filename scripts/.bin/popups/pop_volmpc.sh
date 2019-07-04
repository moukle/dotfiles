#!/bin/sh
notify-send -r 116 "mpc volume: $(mpc volume | awk '{print $2}')"
