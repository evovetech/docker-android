#!/bin/bash

dir="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"

if [[ -z "${DOCKER_REPO}" ]]; then
  export DOCKER_REPO="evovetech/android"
fi
if [[ -z "${CACHE_TAG}" ]]; then
  export CACHE_TAG="latest"
fi

${dir}/hooks/build
