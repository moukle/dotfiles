#! /bin/fish

# Input arguments
set -l IMAGE_DIR     $argv[1]
set -l TIMER_SECONDS $argv[2]

# ================================================
# Generate config
# ================================================
set -l CONFIG "$HOME/.config/hypr/hyprpaper"
set -l MONITOR "eDP-1"

# preload for every image
for IMG in $(command ls $IMAGE_DIR)
    set -l IMG $IMAGE_DIR/$IMG
    echo "preload = $IMG" >> $CONFIG
end

# setting monitor for first start
echo "wallpaper = $MONITOR,$IMG" >> $CONFIG

# show config
echo "============================================"
echo "|> Generated config"
echo "> cat $CONFIG"
echo
command cat $CONFIG | head -2
echo ...
command cat $CONFIG | tail -2
echo "============================================"
echo 

# starting hypr to preload stuff
function on_sigint --on-signal SIGINT
    pkill hyprpaper
    exit
end

pkill hyprpaper

echo "|> Starting hyprpaper"
echo

hyprpaper >> /dev/null &
# ================================================
# Generate config
# ================================================
echo "============================================"
echo "|> Changing wallpaper every $TIMER_SECONDS seconds..."
    echo "--- $IMG"

while true
    for IMG in $(command ls $IMAGE_DIR | shuffle)
        sleep $TIMER_SECONDS
        echo "--- $IMG"
        set -l IMG "$IMAGE_DIR$IMG"
        hyprctl hyprpaper preload "$IMG"            >> /dev/null
        hyprctl hyprpaper wallpaper "eDP-1,$IMG"    >> /dev/null
        pkill swaybg
    end
end
