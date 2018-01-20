#!/bin/bash

dir="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"

cd ${dir}/..

source "${ANDROID_INSTALL_TOOLS}/env.sh"
./gradlew wrapper --stacktrace --info
