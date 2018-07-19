#!/bin/bash

export ROOT_DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"
export BIN_DIR="${ROOT_DIR}/bin"
export CONCURRENT_LIB="concurrent.lib.sh"
export BUILD_ARGS=()

function add_build_arg {
    BUILD_ARGS+=(--build-arg "$@")
}

if [[ -z "${DOCKERFILE_PATH}" ]]; then
  root="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"
  export DOCKERFILE_PATH="${root}/Dockerfile"
fi

if [[ -z "${DOCKER_REPO}" ]]; then
  export DOCKER_REPO="evovetech/android"
fi

default_gradle_version="gradle-4.5.1"
if [[ -z "${GRADLE_VERSION}" ]]; then
  export GRADLE_VERSION="${default_gradle_version}"
fi
