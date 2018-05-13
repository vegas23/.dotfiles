#!/bin/sh

exec awesome

userresources=$HOME/.Xresources
sysresource=/etc/X11/xinit/.Xresources

# merge in default and keymaps


if [ -f "$sysresources" ]; then
    xrdb -merge "$sysresources"
fi

if [ -f "$sysmodmap" ]; then
    xmodmap "$sysmodmap"
fi

if [ -f "$userresources" ]; then
    xrdb -merge "$userresources"
fi

if [ -f "$usermodmap" ]; then
    xmodmap "$usermodmap"
fi

if [ -d /etc/X11/xinit/xinitrc.d ] ; then
    for f in /etc/X11/xinit/xinitrc.d/?*.sh ; do
        [ -x "$f" ] && . "$f"
    done
    unset f
fi

# xcompmgr &
compton --config .config/compton.conf &

# select wm/de with: startx ~/.xinitrc session
session=${1:-awesome}

case "$session" in
    awesome)
        exec awesome ;;
    termite|term)
        exec termite --geometry='1920x1980' ;;
    alacritty)
        exec alacritty --dimensions 213 56 ;;
    i3|i3wm)
        exec i3 ;;
    gnome)
        exec gnome ;;
    *)
        exec "$session"
esac
