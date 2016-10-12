# Disable access control
xhost +SI:localuser:$USER

# Themes, etc
gnome-settings-daemon &

# Fallback cursor
xsetroot -cursor_name left_ptr

# Keyboard repeat rate
xset r rate 200 75
xrdb ~/.Xresources
setxkbmap se
xmodmap ~/.Xmodmap

# Start Emacs
exec dbus-launch --exit-with-session emacs
# exec i3
