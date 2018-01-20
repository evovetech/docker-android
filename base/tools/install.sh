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

echo "Installing packages"
android_install "${ANDROID_INSTALL_TOOLS}/package-list.txt"

echo "Updating SDK"
android_update
