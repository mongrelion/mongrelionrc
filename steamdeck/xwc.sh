#!/usr/bin/env bash

headers=linux-neptune-61-headers-6.1.52.valve6-1-x86_64.pkg.tar.zst

function install_packages {
  packages="$@"
  for package in ${packages}; do
    if [ ! pacman -Qi "${package}" > /dev/null 2>&1 ]; then
      pacman -S --noconfirm "${package}"
    else
      echo "-> package ${package} already installed"
    fi
  done
}

function install_kernel_headers {
  cd /home/deck/Downloads
  curl -L "https://steamdeck-packages.steamos.cloud/archlinux-mirror/jupiter-main/os/x86_64/${headers}" > "${headers}"
  pacman -U --noconfirm "${headers}"
}

function initialize_pacman_keyring {
  pacman-key --init
  pacman-key --populate archlinux
  pacman-key --populate holo
}

function setup_xone {
  cd /home/deck/Downloads/xone
  ./install.sh
  ./install/firmware.sh
}

steamos-readonly disable
initialize_pacman_keyring
install_packages dkms cabextract
install_kernel_headers
setup_xone
