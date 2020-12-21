#!/usr/bin/bash
chosen="$(echo -e "Shutdown\nReboot\nLock\nSuspend\nHibernate\nLogout" | wofi -d -L 6 -W 200 -H 200)"
case $chosen in
    Shutdown) systemctl poweroff ;;
    Reboot) systemctl reboot ;;
    Lock) swaylock -f -c 000000 ;;
    Suspend) systemctl suspend ;;
    Hibernate) systemctl hibernate ;;
    Logout) swaymsg exit ;;
esac
exit
