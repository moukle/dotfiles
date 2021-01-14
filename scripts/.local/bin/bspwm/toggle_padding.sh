#!/bin/bash

current=$(bspc config top_padding)

if [ $current != 60 ]; then
    bspc config top_padding 60
else
    bspc config top_padding 20
fi
