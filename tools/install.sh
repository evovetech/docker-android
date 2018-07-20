#!/bin/bash

source "${ANDROID_ROOT}/tools/env.sh"

if [[ -n "$1" ]]; then
  pkgs=("$@")
  echo "Installing packages: ${pkgs[@]}"
  android_install_packages "${pkgs[@]}"
else
  echo "Installing default packages"
  android_install default-packages.txt
fi
