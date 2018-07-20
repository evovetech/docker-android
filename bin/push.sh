#!/bin/bash

bin="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"
root="${bin}/.."

source ${bin}/env.sh

# build
${bin}/build.sh

# push main image
docker push "evovetech/android:${CACHE_TAG}"
${root}/hooks/post_push
