#!/bin/sh
#
# z3bra - (c) wtfpl 2014
# Popup wrapper used to stack notifications together

# fifo that we'll use to feed the popups
test -p /tmp/popup.fifo || mkfifo /tmp/popup.fifo

# popup definition
w=150
h=20
x=1930
y=10

# popup counter (starts at -1 so that the first popup has no offset
n=-1

# get messages from the fifo
tail -f /tmp/popup.fifo | while IFS= read -r message; do
    # increment the counter
	    n=$((n + 1))

		    {
				        # display the popup under the others
						        /home/morph/.bin/scripts/popups/popup.sh -g ${w}x${h}+${x}+$((y + (h+y) * n)) $n ${message}

								        # decrement the counter
										        n=$((n - 1))
												    } &
												done
