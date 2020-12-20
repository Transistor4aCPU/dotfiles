#!/bin/bash
id=$(swaymsg -t get_tree | jq -r '.nodes[].nodes[] | if .nodes then [recurse(.nodes[])] else [] end + .floating_nodes | .[] | select(.nodes==[]) | (.name + " (" + (.id | tostring) + ")")' | sed -n '1!p' | wofi --show dmenu -L 10 | grep -o '[[:digit:]]*')
swaymsg "[con_id=$id]" focus
exit
