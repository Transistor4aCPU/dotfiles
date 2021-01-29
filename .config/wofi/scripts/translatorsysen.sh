#!/bin/bash
SOURCE="$(echo "$LANG" | grep -o ^..)"
SEARCH="$(wofi -d -L 1 | sed 's/ /+/g')"
SUGGESTION=$(curl "https://libretranslate.com/translate" -H "Content-Type: application/json" -d "{\"q\": \"${SEARCH}\", \"source\": \"${SOURCE}\", \"target\": \"en\"}" | sed 's/^{"translatedText":"//g' | rev | sed 's/^}"//g'| rev | sed 's/+/ /g')
wl-copy "$SUGGESTION"
exit
