#!/bin/sh

# fiz issue with invisible cursor
export WLR_NO_HARDWARE_CURSORS=1
export XWAYLAND_NO_GLAMOR=1

# enable support in firefox
export MOZ_ENABLE_WAYLAND=1
export MOZ_USE_XINPUT2=1

# telling other apps they are run on wayland
export XDG_CURRENT_DESKTOP=sway
export GDK_BACKEND=wayland
export WLR_RENDERER=vulkan
export _JAVA_AWT_WM_NONREPARENTING=1

exec ssh-agent sway --unsupported-gpu
