#!/bin/bash

current=$(bspc config -m ^1 top_padding)

if [ $current == 8 ]; then
    bspc config -m ^1 top_padding 73
else
    bspc config -m ^1 top_padding 8
fi
