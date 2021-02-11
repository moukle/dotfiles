#! /bin/env bash

while getopts m: flag
do
    case "${flag}" in
        m) monitor=${OPTARG};;
    esac
done

# set colors
source ~/.cache/wal/colors.sh
active_color=$color7
hidden_color=$color8
focus_color=$color3
bg_color=$color0

# get nodes
hidden_nodes=($(bspc query --monitor ^$monitor --desktop .active --nodes --node .hidden.\!focused))
active_nodes=($(bspc query --monitor ^$monitor --desktop .active --nodes --node .\!hidden.\!focused))
focused_node=($(bspc query --monitor ^$monitor --desktop .active --nodes --node .focused))

# combine nodes and sort
all_nodes=( "${active_nodes[@]}" "${hidden_nodes[@]}" "${focused_node[@]}" )
readarray -t all_nodes < <(for a in "${all_nodes[@]}"; do echo "$a"; done | sort)

# add colors
declare -A colormap
for n in "${active_nodes[@]}"; do colormap[$n]=$active_color; done
for n in "${hidden_nodes[@]}"; do colormap[$n]=$hidden_color; done
colormap[$focused_node]=$focus_color
# for n in "${active_nodes[@]}"; do echo ${colormap[$n]}; done

# add title
declare -A titlemap
# for n in "${all_nodes[@]}"; do titlemap[$n]=$(xtitle -t 15 $n); done
for n in "${all_nodes[@]}"; do titlemap[$n]=$(xtitle $n); done

# build output
ipc="polybar-msg hook bspnodes_ipc 1"
cmd_hide="xargs -I arg0 bspc node arg0 -g hidden && $ipc"
cmd_focus="xargs -I arg0 bspc node arg0 -f && $ipc"

output=""
for n in ${all_nodes[@]}; do
	title=${titlemap[$n]};
	color=${colormap[$n]}
	icon=$(title_to_icon.sh "$title")

	if [[ $title ]]; then
		output+="%{A1:echo $n | $cmd_focus:}"
		output+="%{A3:echo $n | $cmd_hide:}"
		output+="%{B$bg_color} %{F$color} $icon %{F-} %{B-}%{A}%{A}"
	fi
done

echo $output
