#!/bin/bash

DIR="$HOME/.config/polybar"

kill_bar() {
	killall -q polybar
	while pgrep -u $UID -x polybar >/dev/null; do sleep 1; done
}

while true; do
  kill_bar
  polybar -q all -c $DIR/main.ini &

  inotifywait --event create,modify --recursive --quiet $DIR
done

# polybar -q bspwm -c $DIR/main.ini &
# polybar -q polywins -c $DIR/main.ini &
# polybar -q tray -c $DIR/main.ini &
# polybar -q volume -c $DIR/main.ini &
# polybar -q time -c $DIR/main.ini &
# polybar -q date -c $DIR/main.ini &
