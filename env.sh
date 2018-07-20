#!/bin/bash

export ROOT_DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"

if [[ -z "${DOCKERFILE_PATH}" ]]; then
  root="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"
  export DOCKERFILE_PATH="${root}/Dockerfile"
fi

default_gradle_version="gradle-4.5.1"
if [[ -z "${GRADLE_VERSION}" ]]; then
  export GRADLE_VERSION="${default_gradle_version}"
fi
