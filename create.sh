#!/bin/bash

dir="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"

# Create base image
cd ${dir}/docker-base
docker build -t evovetech/android-base .
st=$?
if [[ $st -ne 0 ]]; then
  exit $st
fi

# Create main image
cd ${dir}/docker
docker build -t evovetech/android .
st=$?
if [[ $st -ne 0 ]]; then
  exit $st
fi

# Create container with volume
docker create \
    --name android-sdk \
    --mount type=volume,source=android-sdk,destination=/opt/android/sdk \
    evovetech/android \
    &> /dev/null

# exit successfully no matter what
exit 0
