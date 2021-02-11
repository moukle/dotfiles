#!/bin/bash

current=$(bspc config -m ^1 top_padding)

if [ $current == 10 ]; then
    bspc config -m ^1 top_padding 55
else
    bspc config -m ^1 top_padding 10
fi
