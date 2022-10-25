#!/bin/fish

for f in $(find . -type f -name "*.svg")
    sed -i "s/#000000/#ffffff/" $f
end
