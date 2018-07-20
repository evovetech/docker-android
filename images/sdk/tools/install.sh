#!/bin/bash

source "${ANDROID_TOOLS_DIR}/env.sh"

echo "Make sure repositories.cfg exists"
mkdir -p "${ANDROID_HOME}/.android/"
touch "${ANDROID_HOME}/.android/repositories.cfg"

echo "Copying Licences"
cp -rv "${ANDROID_LICENSES_DIR}" "${ANDROID_ANDROID_HOME}/licenses"

echo "Accepting Licenses"
android_sdkmanager "--licenses --verbose"

echo "Installing packages"
android_install "${ANDROID_TOOLS_DIR}/package-list.txt"
