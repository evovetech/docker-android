#!/bin/bash

source "${ANDROID_INSTALL_TOOLS}/android-env.sh"
echo "Set ANDROID_HOME to ${ANDROID_HOME}"
mkdir -p "${ANDROID_HOME}"

cd ${ANDROID_INSTALL_ROOT}

echo "Make sure repositories.cfg exists"
mkdir -p "${ANDROID_HOME}/.android/"
touch "${ANDROID_HOME}/.android/repositories.cfg"

echo "Bootstrapping SDK-Tools"
wget -q https://dl.google.com/android/repository/sdk-tools-linux-3859397.zip -O sdk-tools-linux.zip
unzip sdk-tools-linux.zip -d "${ANDROID_HOME}"
rm -rf sdk-tools-linux.zip

echo "Copying Licences"
cp -rv "${ANDROID_INSTALL_LICENSES}" "${ANDROID_HOME}/licenses"
