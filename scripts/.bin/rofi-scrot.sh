#!/usr/bin/env bash

_rofi() {
  rofi -sep '|' -columns 4 -lines 1 -disable-history true -cycle true \
    -theme ~/.config/rofi/theme/rofi-smallmenu.rasi -location 5 -width 280 -height 20 \
    -dmenu -font "Hack Nerd Font 10" -mesg "scrot menu"
}

choice=$(echo "|濾|类|" | _rofi)

case "$choice" in
  )
    ~/.bin/ss-with-preview.sh e
    ;;
  濾)
    ~/.bin/ss-with-preview.sh se
    ;;
  类)
    ~/.bin/ss-with-preview.sh ue
    ;;
  )
    delay=$(echo "3|5|7|10" | _rofi)
    ~/.bin/ss-with-preview.sh de ${delay}
    ;;
esac
