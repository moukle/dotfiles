float=`xbacklight`
bat=${float%.*}
notify-send -r 118 "backlight: $bat%"
