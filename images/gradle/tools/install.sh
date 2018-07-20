#!/bin/bash

dir="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"

cd ${dir}/..

echo "distributionUrl=https\://services.gradle.org/distributions/${GRADLE_VERSION}-bin.zip" \
    >> "gradle/wrapper/gradle-wrapper.properties"

./gradlew wrapper --stacktrace --info
