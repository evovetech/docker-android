#!/bin/bash

cd ${ANDROID_INSTALL_ROOT}

echo "Set ANDROID_HOME to ${ANDROID_HOME}"
mkdir -p "${ANDROID_HOME}"

echo "Bootstrapping SDK-Tools"
wget -q https://dl.google.com/android/repository/sdk-tools-linux-3859397.zip -O sdk-tools-linux.zip
unzip sdk-tools-linux.zip -d "${ANDROID_HOME}"
rm -rf sdk-tools-linux.zip
