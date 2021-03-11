#!/bin/bash

# automatically send map to remote srv and reload on save
# first setup fifofile (mkfifo) and set in config (sv_input_fifo "path")

local_dir=$(pwd)
remote_dir=/root/DDNet-15.3.2-linux_x86_64/data/maps
while true; do
    file=`inotifywait -q -e modify --format '%w%f' $local_dir`
    if [ ! -z $file ]
    then
        echo "======= CHANGE ======="
        scp $file nls:$remote_dir
        file_name=${file##*/}
        ssh nls "echo 'reload; change_map ${file_name%.map}' > /usr/local/share/ddnet/8303.fifo"
        sleep 1
    fi
done
