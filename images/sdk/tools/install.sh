#!/bin/bash

source "${TOOLS_DIR}/env.sh"

echo "Make sure repositories.cfg exists"
mkdir -p "${ANDROID_HOME}/.android/"
touch "${ANDROID_HOME}/.android/repositories.cfg"

echo "Copying Licences"
cp -rv "${LICENSES_DIR}" "${ANDROID_HOME}/licenses"

cd ${ROOT_DIR}

echo "Accepting Licenses"
android_sdkmanager "--licenses --verbose"

echo "Installing packages"
android_install "${TOOLS_DIR}/package-list.txt"
