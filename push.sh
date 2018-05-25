#!/bin/bash

dir="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"
source ${dir}/hooks/__env.sh

( cd ${dir}/hooks && ./build )
docker push "${DOCKER_REPO}:${CACHE_TAG}"
( cd ${dir}/hooks && ./post_push )
