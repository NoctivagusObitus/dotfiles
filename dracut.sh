#!/bin/sh

KERNEL_VERSION="${1:-$(/home/markus/eselect_kernel_version.sh)}"

echo
echo "kernel version: $KERNEL_VERSION"
echo

# nvidia nvidia_modeset nvidia_uvm nvidia_drm
#/home/markus/mount_boot.sh &&
dracut \
  --kver="$KERNEL_VERSION" \
  --hostonly \
  --fstab \
  --early-microcode \
  --omit " nvidia nvidia-drm nvidia-modeset nvidia-uvm " \
  --add " bash crypt lvm resume btrfs systemd-cryptsetup " \
  --add-drivers " nvme i965 " &&
  echo "backup old initramfs" &&
  sudo mv -v /boot/EFI/Gentoo/initramfs /boot/EFI/Gentoo_old/initramfs &&
  echo "move new initramfs in place" &&
  sudo mv -iv "/boot/initramfs-${KERNEL_VERSION}.img" /boot/EFI/Gentoo/initramfs &&
  echo "cleanup boot directory" &&
  sudo find /boot/ -maxdepth 1 -type f -not -path "*${KERNEL_VERSION}*" -not -name .keep -exec rm -v {} \; &&
  echo "new initramfs:" &&
  ls -alh /boot/EFI/Gentoo/ &&
  echo 'success' ||
  echo 'somehting went wrong; pls check output'
