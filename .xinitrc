#!/bin/sh
#
# ██╗  ██╗██╗███╗   ██╗██╗████████╗██████╗  ██████╗
# ╚██╗██╔╝██║████╗  ██║██║╚══██╔══╝██╔══██╗██╔════╝
#  ╚███╔╝ ██║██╔██╗ ██║██║   ██║   ██████╔╝██║
#  ██╔██╗ ██║██║╚██╗██║██║   ██║   ██╔══██╗██║
# ██╔╝ ██╗██║██║ ╚████║██║   ██║   ██║  ██║╚██████╗
# ╚═╝  ╚═╝╚═╝╚═╝  ╚═══╝╚═╝   ╚═╝   ╚═╝  ╚═╝ ╚═════╝
#

userresources=$HOME/.Xresources
usermodmap=$HOME/.Xmodmap
sysresources=/etc/X11/xinit/.Xresources
sysmodmap=/etc/X11/xinit/.Xmodmap

extern=HDMI-1-0
intern=eDP-1

# Merge in Defaults and Keymaps

if [ -f $sysresources ]; then
    xrdb -merge $sysresources
fi

if [ -f $sysmodmap ]; then
    xmodmap $sysmodmap
fi

if [ -f "$userresources" ]; then
    xrdb -merge "$userresources"
fi

if [ -f "$usermodmap" ]; then
    xmodmap "$usermodmap"
fi

if xrandr | grep "$extern disconnected"; then
    xrandr --output "$extern" --off --output "$intern" --auto
else
    xrandr --output "$intern" --auto --output "$extern" --primary --right-of "$intern" --auto
fi

# Start i3 Window Manager when starting X Server
exec i3
