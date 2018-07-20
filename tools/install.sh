#!/bin/bash

source "${ANDROID_ROOT}/tools/env.sh"

echo "Installing packages"
android_install "${@}"
