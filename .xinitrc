export PRIMARY_DISPLAY="$(xrandr | awk '/ primary/{print $1}')"

xrdb -load $HOME/.config/X11/xresources &

exec /usr/bin/i3
