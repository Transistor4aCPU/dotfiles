#!/bin/bash
SEARCH="$(wofi -d)"
SUGGESTION=$(curl https://ac.ecosia.org/?q=${SEARCH} | grep -o -P '(?<="suggestions"\:\[").*(?="\]\})' | sed 's/","/\n/g')
CHOOSEN=$(echo "$SUGGESTION" | wofi -d | sed 's/ /+/g')
xdg-open "https://www.ecosia.org/search?q=${CHOOSEN}"
exit
