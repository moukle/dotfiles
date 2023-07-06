#!/bin/sh
#  double borders
# needs chwb2 from wmutils/opt

outer=$1
inner1=$2
inner2=$3

# outer='0xf2f2f2'   # outer
# inner1='0xf4baf0'  # focused
# inner2='0xd6d8db'  # normal

trap 'bspc config border_width 0; kill -9 -$$' INT TERM

targets() {
	case $1 in
		focused) bspc query -N -n .local.focused.\!fullscreen;;
		normal)  bspc query -N -n .\!focused.\!fullscreen
	esac
}
bspc config border_width 12

draw() { chwb2 -I "$inner" -O "$outer" -i "2" -o "10" $*; }

# initial draw, and then subscribe to events
{ echo; bspc subscribe node_geometry node_focus; } |
	while read -r _; do
		[ "$v" ] || v='abcdefg'
		inner=$inner1 draw $(targets focused)
		inner=$inner2 draw $(targets  normal)
	done
