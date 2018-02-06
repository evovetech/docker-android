#!/bin/bash

dir="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"

# create container & volume
${dir}/create.sh
st=$?
if [[ $st -ne 0 ]]; then
  exit $st
fi

# Run container with volumes
docker run -it --rm \
    --mount type=volume,source=mobileapps-androidSdk,destination=/home/android/sdk \
    --mount type=volume,source=mobileapps-gradle,destination=/home/android/.gradle \
    --net=host \
    evovetech/android "$@"
