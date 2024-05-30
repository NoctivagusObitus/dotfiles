#!/bin/bash

KERNEL_VERSION=$(/home/markus/eselect_kernel_version.sh)
echo "$KERNEL_VERSION"

#sudo cp -v "$(ls -t /usr/src/*/.config | head -n1)" /usr/src/linux/ &&
#/home/markus/mount_boot.sh \
echo "set new kernel version" &&
  eselect kernel set "$(eselect kernel list | tail -n1 | cut -d'[' -f2 | cut -d']' -f1)" &&
  KERNEL_VERSION=$(/home/markus/eselect_kernel_version.sh) &&
  echo "new kernel: ${KERNEL_VERSION}" &&
  echo &&
  cd -P /usr/src/linux &&
  OLD_CONF="$(find /usr/src/linux-*/.config -type f | sort | tail -n1)" &&
  echo "get old config $OLD_CONF - ${OLD_CONF%"$KERNEL_VERSION"*}" &&
  test "$OLD_CONF" != "${OLD_CONF%"$KERNEL_VERSION"*}" ||
  sudo cp -v "$OLD_CONF" ./ &&
  sudo make oldconfig &&
  echo "compile kernel und modules" &&
  sudo make -j16 &&
  sudo make -j16 modules_install &&
  sudo emerge --ask --verbose --quiet-build @module-rebuild &&
  echo "backup old linux kernel" &&
  sudo mv -v /boot/EFI/Gentoo/vmlinuz /boot/EFI/Gentoo_old/vmlinuz &&
  echo "move new linux kernel in place" &&
  sudo make install &&
  sudo mv -iv /boot/vmlinuz /boot/EFI/Gentoo/vmlinuz &&
  echo "cleanup boot directory" &&
  sudo find /boot/ -maxdepth 1 -type f -not -path "*${KERNEL_VERSION}*" -not -name .keep -exec rm -v {} \; &&
  echo &&
  echo "new linux kernel:" &&
  ls -lh /boot/EFI/Gentoo/ &&
  echo 'success' ||
  echo 'somehting went wrong; pls check output'
