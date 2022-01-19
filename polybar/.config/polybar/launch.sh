#!/bin/bash

DIR="$HOME/.config/polybar"

kill_bar() {
	# Terminate already running bar instances
	killall -q polybar

	# Wait until the processes have been shut down
	while pgrep -u $UID -x polybar >/dev/null; do sleep 1; done
}

kill_bar

# polybar -q all -c $DIR/main.ini &
polybar -q bspwm -c $DIR/main.ini &
polybar -q polywins -c $DIR/main.ini &
polybar -q tray -c $DIR/main.ini &
polybar -q volume -c $DIR/main.ini &
polybar -q time -c $DIR/main.ini &
polybar -q date -c $DIR/main.ini &
