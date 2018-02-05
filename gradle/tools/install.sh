#!/bin/bash

dir="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"

cd ${dir}/..

source "${TOOLS_DIR}/env.sh"
./gradlew wrapper --stacktrace --info
