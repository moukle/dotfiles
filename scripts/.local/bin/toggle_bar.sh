#! /bin/sh

TOGGLE=/tmp/polybar_is_hidden

if [ ! -e $TOGGLE ]; then
	touch $TOGGLE
	$HOME/.config/polybar/launch.sh workspacesL workspacesM &
	sleep 1.5
	# xdo hide -n polybar
	bspc config bottom_padding 22
	bspc config left_padding 22
	bspc config right_padding 22
	bspc config top_padding 22
	
else
	rm $TOGGLE
	$HOME/.config/polybar/launch.sh left middle right &
	# xdo show -n polybar
	bspc config bottom_padding 0
	bspc config left_padding 0
	bspc config right_padding 0
	bspc config top_padding 55
fi
