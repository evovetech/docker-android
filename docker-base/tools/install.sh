#!/bin/bash

source "${ANDROID_INSTALL_TOOLS}/env.sh"

echo "Make sure repositories.cfg exists"
mkdir -p "${ANDROID_HOME}/.android/"
touch "${ANDROID_HOME}/.android/repositories.cfg"

echo "Copying Licences"
cp -rv "${ANDROID_INSTALL_LICENSES}" "${ANDROID_HOME}/licenses"

cd ${ANDROID_INSTALL_ROOT}

echo "Accepting Licenses"
android_sdkmanager "--licenses --verbose"

echo "Updating SDK"
update_sdk

echo "Installing packages"
PREV_IFS="$IFS"
IFS=$'\n'
pkgs=($( cat "${ANDROID_INSTALL_TOOLS}/package-list.txt" ))
IFS="${PREV_IFS}"
for pkg in "${pkgs[@]}"; do
  android_sdkmanager "${pkg} --verbose"
done
