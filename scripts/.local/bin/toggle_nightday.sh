#! /bin/sh

TOGGLE=/tmp/its_night

if [ ! -e $TOGGLE ]; then
	rm $TOGGLE
	squash base16_tomorrow_night
else
	touch $TOGGLE
	squash paper
fi
