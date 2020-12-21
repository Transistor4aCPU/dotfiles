#!/bin/bash
SEARCH="$(wofi -d -L 1)"
SUGGESTION=$(curl https://ac.ecosia.org/?q=${SEARCH} | grep -o -P '(?<="suggestions"\:\[").*(?="\]\})' | sed 's/","/\n/g' | wofi -d -L 8 | sed 's/ /+/g')
xdg-open "https://www.ecosia.org/search?q=${SUGGESTION}"
exit
