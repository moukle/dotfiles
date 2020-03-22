#!/bin/bash

# automatically send map to remote srv and reload on save
# first setup fifofile (mkfifo) and set in config (sv_input_fifo "path")

local_dir=$HOME/.teeworlds/maps/
remote_dir=/usr/local/share/ddnet/data/maps/

while true; do
	file=$(inotifywait -q -e modify --format %f $local_dir)
	if [ ! -z $file ]
	then
		echo "======= CHANGE ======="
		scp $local_dir/$file nils_server:$remote_dir
		sleep 1
		ssh nils_server "echo reload > /usr/local/share/ddnet/8303.fifo"
	fi
done
