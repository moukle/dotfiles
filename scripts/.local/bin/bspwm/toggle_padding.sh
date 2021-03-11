#!/bin/bash

current=$(bspc config -m ^1 top_padding)

if [ $current == 30 ]; then
    bspc config -m ^1 top_padding 65
else
    bspc config -m ^1 top_padding 30
fi
