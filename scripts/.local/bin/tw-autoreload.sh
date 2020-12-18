#!/bin/bash

# automatically reload map on write
# first setup fifofile (mkfifo) and set in config (sv_input_fifo "path")

fifofile=/tmp/ddnet.fifo

local_dir=$HOME/.teeworlds/maps/
mkfifo $fifofile

while true; do
	file=$(inotifywait --recursive -q -e modify --format %f $local_dir)
	if [ ! -z $file ]
	then
		echo "======= RELOAD ======="
		echo reload > $fifofile
	fi
done
