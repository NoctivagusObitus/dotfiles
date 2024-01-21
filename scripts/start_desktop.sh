#!/bin/sh
export WLR_NO_HARDWARE_CURSORS=1
export XWAYLAND_NO_GLAMOR=1
export MOZ_ENABLE_WAYLAND=1
export MOZ_USE_XINPUT2=1
export XDG_CURRENT_DESKTOP=sway
export WLR_RENDERER=vulkan
export GDK_BACKEND=wayland
export _JAVA_AWT_WM_NONREPARENTING=1

exec ssh-agent sway --unsupported-gpu
