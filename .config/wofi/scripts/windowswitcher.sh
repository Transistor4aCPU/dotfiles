#!/bin/bash
id=$(swaymsg -t get_tree | jq -r '.nodes[].nodes[] | if .nodes then [recurse(.nodes[])] else [] end + .floating_nodes | .[] | select(.nodes==[]) | (.name + " (" + (.id | tostring) + ")")' | sed -n '1!p' | sed '/^1/d' | sed '/^2/d' | sed '/^3/d' | sed '/^4/d' | sed '/^5/d' | sed '/^6/d' | sed '/^7/d' | sed '/^8/d' | sed '/^9/d' | sed '/^0/d' | wofi --show dmenu -L 10 -O alphabetical -b -i | grep -o -P "(?<=\().*(?=\))")
swaymsg "[con_id=$id]" focus
exit
