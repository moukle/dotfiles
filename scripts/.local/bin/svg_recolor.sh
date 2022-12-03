#!/bin/fish

for f in $(find . -type f -name "*.svg")
    sed -i "s/#999999/#ffffff/" $f
end
