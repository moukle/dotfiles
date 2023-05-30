#!/bin/fish

set BEFORE $1
set AFTER  $2

for f in $(find . -type f -name "*.svg")
    sed -i "s/$BEFORE/$AFTER/" $f
end
