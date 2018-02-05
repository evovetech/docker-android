#!/bin/bash

dir="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"

# create container & volume
${dir}/create.sh
st=$?
if [[ $st -ne 0 ]]; then
  exit $st
fi

# Run with created volume
docker run -it --rm \
    --volumes-from android-sdk \
    evovetech/android "$@"
