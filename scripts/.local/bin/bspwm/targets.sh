#!/bin/sh
#  output windows

case $1 in
	focused) bspc query -N -d .active -n .local.\!hidden.focused.\!fullscreen;;
	normal)  bspc query -N -d .active -n .local.\!hidden.\!focused.\!fullscreen ;;
	other)   bspc query -N -d .active -n .\!local.\!focused.\!hidden.\!fullscreen
esac
