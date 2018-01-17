#!/usr/bin/env bash

export ANDROID_SDK_ROOT=${ANDROID_HOME}
export ANDROID_SDK_HOME=${ANDROID_HOME}
export ANDROID_SDK=${ANDROID_HOME}

export PATH=${PATH}:${ANDROID_HOME}/platform-tools:${ANDROID_HOME}/tools/bin:${ANDROID_HOME}/emulator:${ANDROID_HOME}/bin:

function print_header() {
    figlet SBB CFF FFS
    figlet welcome to
    figlet andep
    echo ''
    echo ''
    echo ''
}

function help() {
    figlet "usage:"
    echo "update_sdk: Updates the SDK"
    echo "andep: Installs one or more android Packets."
    echo "   -Example: anddep \"platforms;android-26\""
    echo "help: Shows this help"
    echo ''
    echo ''
    echo ''
}

function android_sdkmanager() {
    local cmd="${ANDROID_INSTALL_TOOLS}/sdkmanager.sh"
    $cmd "sdkmanager $@"
}

function update_sdk() {
    android_sdkmanager "--update"
}

function andep() {
    if [ -z ${1} ]; then
        help
        return 1
    fi
    android_sdkmanager  "${1}"
}

export -f help
export -f android_sdkmanager
export -f update_sdk
export -f andep
