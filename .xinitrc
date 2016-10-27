xset r rate 200 75
xrdb ~/.Xresources
setxkbmap se
xmodmap ~/.Xmodmap
trayer --edge top --align right --SetDockType true --SetPartialStrut true --expand true --width 10 --transparent true --tint 0x000000 --height 15&
pulseaudio&
exec dbus-launch --exit-with-session xmonad
