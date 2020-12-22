#!/bin/bash
CHOOSEN=$(cat ~/.config/wofi/todo.md | wofi -d -L 10)
if [ "$CHOOSEN" = "" ]
	then exit
	elif [[ "$CHOOSEN" = "-"* ]]; then sed -i "/${CHOOSEN}/s/-/x/g" ~/.config/wofi/todo.md
	elif [[ "$CHOOSEN" = "x"* ]]; then sed -i "/${CHOOSEN}/d" ~/.config/wofi/todo.md
	else echo "$CHOOSEN" | sed 's/^/- /' >> ~/.config/wofi/todo.md
fi
exit
