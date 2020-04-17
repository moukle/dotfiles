#! /bin/sh

TOGGLE=/tmp/its_night

if [ ! -e $TOGGLE ]; then
	touch $TOGGLE
	squash base16_tomorrow_night
else
	rm $TOGGLE
	squash paper
fi
