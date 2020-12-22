#!/bin/bash
if [ "$(checkupdates | wc -l)" -ne 0 ]
	then echo "$(checkupdates | wc -l)"
fi
exit
