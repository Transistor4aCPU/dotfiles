#!/bin/bash
SEARCH="$(wofi -d -L 1 | sed 's/ /+/g')"
SUGGESTION=$(curl https://ac.ecosia.org/?q=${SEARCH} | grep -o -P '(?<="suggestions"\:\[").*(?="\]\})' | sed 's/","/\n/g' | wofi -d -L 8 -p "Search the web..." | sed 's/ /+/g')
if [ "$SUGGESTION" == "" ]; then exit; fi
xdg-open "https://www.ecosia.org/search?q=${SUGGESTION}"
exit
