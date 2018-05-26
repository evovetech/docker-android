#!/bin/bash

dir="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"

cd ${dir}/..

props_file="gradle/wrapper/gradle-wrapper.properties"
echo "distributionUrl=https\://services.gradle.org/distributions/${GRADLE_VERSION}-all.zip" >> $props_file

source "${TOOLS_DIR}/env.sh"
./gradlew wrapper --stacktrace --info
