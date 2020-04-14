#! /bin/sh

TOGGLE=/tmp/its_daytheme

if [ ! -e $TOGGLE ]; then
	touch $TOGGLE
	squash paper
else
	rm $TOGGLE
	squash base16_tomorrow_night
fi
