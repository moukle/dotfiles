#!/bin/bash

current=$(bspc config -m ^1 top_padding)

if [ $current == 3 ]; then
    bspc config -m ^1 top_padding 53
else
    bspc config -m ^1 top_padding 3
fi
