#!/bin/bash

source "${ANDROID_INSTALL_TOOLS}/android-env.sh"

cd ${ANDROID_INSTALL_ROOT}

echo "Accepting Licenses"
android_sdkmanager "--licenses --verbose"

echo "Installing packages"
PREV_IFS="$IFS"
IFS=$'\n'
pkgs=($( cat "${ANDROID_INSTALL_TOOLS}/package-list.txt" ))
IFS="${PREV_IFS}"
for pkg in "${pkgs[@]}"; do
  android_sdkmanager "${pkg} --verbose"
done

echo "Updating SDK"
update_sdk
