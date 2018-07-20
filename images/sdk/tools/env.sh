#!/usr/bin/env bash

export ANDROID_SDK_ROOT=${ANDROID_HOME}
export ANDROID_SDK_HOME=${ANDROID_HOME}
export ANDROID_SDK=${ANDROID_HOME}

export PATH=${PATH}:${ANDROID_HOME}/platform-tools:${ANDROID_HOME}/tools/bin:${ANDROID_HOME}/emulator:${ANDROID_HOME}/bin

function print_header() {
    figlet SBB CFF FFS
    figlet welcome to
    figlet andep
    echo ''
    echo ''
    echo ''
}

function help() {
    echo "usage:"
    echo "update_sdk: Updates the SDK"
    echo "andep: Installs one or more android Packets."
    echo "   -Example: anddep \"platforms;android-26\""
    echo "help: Shows this help"
    echo ''
    echo ''
    echo ''
}

function android_sdkmanager() {
    local cmd="${ANDROID_TOOLS_DIR}/sdkmanager.sh"
    $cmd "sdkmanager $@"
}

function android_update() {
    android_sdkmanager "--update --verbose"
}

function android_install() {
    if [[ $# -eq 0 ]]; then
        help
        return 1
    fi

    echo "Installing packages"
    local prev_ifs="$IFS"
    IFS=$'\n'
    local pkgs=($( cat "$@" ))
    IFS="${prev_ifs}"

    local pkg
    for pkg in "${pkgs[@]}"; do
      android_sdkmanager "${pkg} --verbose"
    done
}

export -f help
export -f android_sdkmanager
export -f android_update
export -f android_install
