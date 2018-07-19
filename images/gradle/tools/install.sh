#!/bin/bash

dir="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"

cd ${dir}/..

props_file="gradle/wrapper/gradle-wrapper.properties"
echo "distributionUrl=https\://services.gradle.org/distributions/${GRADLE_VERSION}-bin.zip" >> $props_file

./gradlew wrapper --stacktrace --info
