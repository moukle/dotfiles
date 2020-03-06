#! /bin/sh

TOGGLE=/tmp/polybar_is_hidden

DEFAULT_BAR_HEIGHT=$(bspc config top_padding)
DEFAULT_PADDING=$(bspc config left_padding)

if [ ! -e $TOGGLE ]; then
	touch $TOGGLE
	$HOME/.config/polybar/launch.sh workspacesL workspacesM workspacesR &
	# xdo hide -n polybar
	bspc config top_padding 10
else
	rm $TOGGLE
	$HOME/.config/polybar/launch.sh left middle right &
	# xdo show -n polybar
	bspc config top_padding 55
fi
