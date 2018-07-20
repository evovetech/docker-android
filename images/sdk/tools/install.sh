#!/bin/bash

source "${ANDROID_ROOT}/tools/env.sh"

echo "Make sure repositories.cfg exists"
mkdir -p "${ANDROID_HOME}/.android/"
touch "${ANDROID_HOME}/.android/repositories.cfg"

echo "Accepting Licenses"
android_sdkmanager "--licenses --verbose"

echo "Installing packages"
android_sdkmanager platform-tools tools

echo "Updating SDK"
android_update
