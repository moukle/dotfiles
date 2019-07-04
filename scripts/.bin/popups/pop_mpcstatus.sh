#!/bin/sh
notify-send -r 113 "mpc is $(mpc status | grep -E "playing|pause" | awk '{print $1}')"
