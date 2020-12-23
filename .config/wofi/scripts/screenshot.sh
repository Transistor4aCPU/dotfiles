#!/usr/bin/bash
chosen="$(echo -e 'Currently active window\nAll visible outputs\nCurrently active output\nManually select a region\nManually select a window' | wofi -d -L 5 -W 200 -H 200 -p 'Screenshotmenu')"
case $chosen in
	"Currently active window" ) grimshot save active ;;
	"All visible outputs" ) grimshot save screen ;;
	"Currently active output" ) grimshot save output ;;
	"Manually select a region" ) grimshot save area ;;
	"Manually select a window" ) grimshot save window ;;
esac
exit
