#!/bin/bash

dir="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"

# build
source ${dir}/env.sh
${dir}/build.sh

# push
docker push "${IMAGE_NAME}"
${dir}/hooks/post_push
