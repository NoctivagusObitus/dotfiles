#!/bin/bash

# nvidia wayland install
# https://wiki.gentoo.org/wiki/NVIDIA/nvidia-drivers#Drivers
# https://www.reddit.com/r/Gentoo/comments/150r74m/guide_hyprland_nvidia_extremely_minimal_gentoo/

# following command may be needed first???
# nvidia-xconfig

# https://www.reddit.com/r/Fedora/comments/150n153/glxinfo_and_steam_flatpak_doesnt_detect_my_nvidia/
__NV_PRIME_RENDER_OFFLOAD=1 __GLX_VENDOR_LIBRARY_NAME=nvidia flatpak run com.valvesoftware.Steam
