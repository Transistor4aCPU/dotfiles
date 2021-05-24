#!/usr/bin/bash
chosen="$(echo -e 'One-time-boot\nEnable-boot-option\nDisable-boot-option\nList-boot-options' | wofi -d -L 4 -W 200 -H 100 -p 'Boot menu')"
onetimeboot() {
BOOTNEXT=$(efibootmgr | sed '1,/BootOrder:/d' | while read BLINE; do NUM=$(echo "$BLINE" | grep -o "^Boot....*" | sed 's/Boot//g' | grep -o "^...." ); OPT=$(echo "$BLINE" | grep -o "^Boot....*" | sed 's/Boot//g' | sed "s/^....//g" | sed 's/^.//g'); echo "${OPT} (${NUM})"; done | wofi -d -p "One time boot option" | rev | grep -o "^)....(" | sed 's/(//g' | sed 's/)//g' | rev)
pkexec efibootmgr --bootnext $BOOTNEXT
}
enableboot() {
ENBOOT=$(efibootmgr | sed '1,/BootOrder:/d' | while read BLINE; do NUM=$(echo "$BLINE" | grep -o "^Boot....*" | sed 's/Boot//g' | grep -o "^...." ); OPT=$(echo "$BLINE" | grep -o "^Boot....*" | sed 's/Boot//g' | sed "s/^....//g" | sed 's/^.//g'); echo "${OPT} (${NUM})"; done | wofi -d -p "Enable boot option" | rev | grep -o "^)....(" | sed 's/(//g' | sed 's/)//g' | rev)
pkexec efibootmgr -Ab $ENBOOT
}
disableboot() {
DSBOOT=$(efibootmgr | sed '1,/BootOrder:/d' | while read BLINE; do NUM=$(echo "$BLINE" | grep -o "^Boot....*" | sed 's/Boot//g' | grep -o "^...." ); OPT=$(echo "$BLINE" | grep -o "^Boot....*" | sed 's/Boot//g' | sed "s/^....//g" | sed 's/^.//g'); echo "${OPT} (${NUM})"; done | wofi -d -p "Disable boot option" | rev | grep -o "^)....(" | sed 's/(//g' | sed 's/)//g' | rev)
pkexec efibootmgr -Ab $DSBOOT
}
listoptions() {
OPTIONS=$(efibootmgr | sed '1,/BootOrder:/d' | while read BLINE; do NUM=$(echo "$BLINE" | grep -o "^Boot....*" | sed 's/Boot//g' | grep -o "^...." ); OPT=$(echo "$BLINE" | grep -o "^Boot....*" | sed 's/Boot//g' | sed "s/^....//g" | sed 's/^.//g'); echo "${OPT} (${NUM})"; done | wofi -d -p "Boot options")
}
case $chosen in
    One-time-boot) onetimeboot ;;
    Enable-boot-option) enableboot ;;
    List-boot-options) listoptions ;;
esac
exit
