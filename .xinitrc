export PRIMARY_DISPLAY="$(xrandr | awk '/ primary/{print $1}')"

xrdb -load $HOME/.Xresources &
xset +fp $HOME/.local/share/fonts/misc/

exec /usr/bin/i3
