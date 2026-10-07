#!/data/data/com.termux/files/usr/bin/bash

pkill -f com.termux.x11 2>/dev/null
sleep 1

termux-x11 :0 -ac &
sleep 2

proot-distro login --bind "$PREFIX/tmp:/tmp" debian -- bash -c '
export DISPLAY=:0
export XDG_RUNTIME_DIR=/tmp/runtime-root
mkdir -p "$XDG_RUNTIME_DIR"
chmod 700 "$XDG_RUNTIME_DIR"
dbus-launch --exit-with-session startxfce4
'
