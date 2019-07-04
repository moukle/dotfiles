#!/bin/sh
# original author Dylan Araps

barname="popupsX"
sleep=4

width=300
height=27
xoffset=18
yoffset=8

bg="#0d0909"
fg="#bab9ad"

font="hack:size=13"
#font="-*-candy-*-*-*--11-*-*-*-*-*-*-*"

# Options
while getopts "w:h:x:y:bg:fg:n:s:f:e:" opt; do
	case $opt in
		w) width="$OPTARG" ;;
		h) height="$OPTARG" ;;
		x) xoffset="$OPTARG" ;;
		y) yoffset="$OPTARG" ;;
		bg) bg="$OPTARG" ;;
		fg) fg="$OPTARG" ;;
		n) barname="$OPTARG" ;;
		s) sleep="$OPTARG" ;;
		f) font="$OPTARG" ;;
		e) echo="$OPTARG" ;;
	esac
done

# Start bar
# Kill previous notifications
if pgrep $barname > /dev/null
then
	kill -9 `ps aux | grep $barname | grep -v grep | awk '{print $2}'`
fi
#ps -ef | grep $barname | grep -v grep | awk '$0 ~ name {print $2}' | xargs kill 2>/dev/null

# Echo notifivation
#xoffset=`expr 1920 - $width`
(echo "%{c} $echo %{c}"; sleep $sleep) | lemonbar -d -n "$barname" -g "$width"x"$height"+"$xoffset"+"$yoffset" -f "$font" -B "$bg" -F "$fg"
