#!/bin/bash

dir="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"
source ${dir}/env.sh

${dir}/hooks/build

docker push "${DOCKER_REPO}:${CACHE_TAG}"

${dir}/hooks/post_push
