xset r rate 200 75
xrdb ~/.Xresources
setxkbmap se
xmodmap ~/.Xmodmap
pulseaudio&
exec dbus-launch --exit-with-session xmonad
#exec mate-session
