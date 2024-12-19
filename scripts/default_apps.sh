#!/bin/sh

swaymsg exec slack
swaymsg exec gtk-launch org.ferdium.Ferdium
swaymsg exec gtk-launch org.gnome.Evolution.desktop
swaymsg exec foot --title newsboat newsboat
swaymsg exec 'systemctl --user start transmission-daemon.service'
