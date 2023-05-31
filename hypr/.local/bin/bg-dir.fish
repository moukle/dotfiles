#! /bin/fish

# Welcome, I randomly cycle wallpapers.

function help
    echo
    echo "|> Run like this"
    echo ":: bg-dir.sh <dir> <delay>"
    echo ":"
    echo ":: <dir> must be absolute"
    echo ":: <delay> in seconds"
    exit
end

if test (count $argv) -ne 2
    help
    exit
end

# Input arguments
set -l IMAGE_DIR     $argv[1]
set -l TIMER_SECONDS $argv[2]

if not test -d $IMAGE_DIR
    echo "!: missing valid directory"
    echo "!: has been: $IMAGE_DIR"
    help
end

if not test $TIMER_SECONDS -gt 0
    echo "!: missing timer"
    echo "!: has been: $TIMER_SECONDS"
    help
end

# ================================================
# Generate config
# ================================================
set -l CONFIG "$HOME/.config/hypr/hyprpaper.conf"
set -l MONITORS $(wlr-randr | grep \" | awk '{print $1}')

# TODO: ask user first
rm $CONFIG && touch $CONFIG

# Preload for every image
for IMG in $(command ls $IMAGE_DIR)
    set -l IMG $IMAGE_DIR/$IMG
    echo "preload = $IMG" >> $CONFIG
end

# Setting monitor for first start
for MONITOR in $MONITORS
    echo "wallpaper = $MONITOR,$IMAGE_DIR/$IMG" >> $CONFIG
end

# Show config
echo "============================================"
echo "|> Generated config"
echo ":: cat $CONFIG"
echo
command cat $CONFIG | head -2
echo "..."
command cat $CONFIG | tail -2
echo "============================================"
echo

# Starting hypr to preload images
echo "|> Starting hyprpaper"
echo

function on_sigint --on-signal SIGINT
    pkill hyprpaper
    exit
end

pkill hyprpaper

hyprpaper >> /dev/null &

# ================================================
# Change Wallpaper
# ================================================
echo "============================================"
echo "|> Changing wallpaper every $TIMER_SECONDS seconds..."
echo "---- $IMG"

while true
    for IMG in $(command ls $IMAGE_DIR | shuffle)
        sleep $TIMER_SECONDS
        echo "---- $IMG"
        set -l IMG "$IMAGE_DIR/$IMG"

        for MONITOR in $MONITORS
            hyprctl hyprpaper wallpaper "$MONITOR,$IMG" >> /dev/null
        end
    end
end

exit
