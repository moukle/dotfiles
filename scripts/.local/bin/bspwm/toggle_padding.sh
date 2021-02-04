#!/bin/bash

current=$(bspc config -d ^1 top_padding)

if [ $current == 0 ]; then
    bspc config -d ^1 top_padding 50
else
    bspc config -d ^1 top_padding 0
fi
