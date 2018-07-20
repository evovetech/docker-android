#!/bin/bash

bin="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"
root="$( cd "${bin}/.." && pwd )"

source ${bin}/env.sh

# build
${bin}/build.sh

# push main image
docker push "evovetech/android:${CACHE_TAG}"
${root}/hooks/post_push
