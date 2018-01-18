#!/bin/bash

# Create container with volume
docker create \
    --name android-sdk \
    --mount type=volume,source=android-sdk,destination=/opt/android/sdk \
    evovetech/android
