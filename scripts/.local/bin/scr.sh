#!/bin/sh

selection=$(slop -f "-i %i -g %g")
shotgun $selection - | xclip -t 'image/png' -selection clipboard

