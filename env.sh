#!/bin/bash

function main() {
  local default_gradle_version="gradle-4.9"

  if [[ -z "${DOCKER_TAG}" ]]; then
    setGradleVersion
    export DOCKER_TAG="${GRADLE_VERSION}"
  else
    setGradleVersion
  fi

  if [[ -z "${BUILD_PATH}" ]]; then
    export BUILD_PATH="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"
  fi

  if [[ -z "${DOCKER_REPO}" ]]; then
    export DOCKER_REPO="evovetech/android"
  fi

  if [[ -z "${DOCKERFILE_PATH}" ]]; then
    export DOCKERFILE_PATH="${BUILD_PATH}/Dockerfile"
  fi

  if [[ -z "${IMAGE_NAME}" ]]; then
    export IMAGE_NAME="${DOCKER_REPO}:${DOCKER_TAG}"
  fi
}

function defaultDockerTag() {
    if [[ -z "${DOCKER_TAG}" ]]; then
      printf "${default_gradle_version}"
    else
      printf "${DOCKER_TAG}"
    fi
}

function setGradleVersion() {
  if [[ -z "${GRADLE_VERSION}" ]]; then
      local tag="$( defaultDockerTag )"
      echo "defaultDockerTag=${tag}"
      case $tag in
        gradle- )
          ## ignore
          ;;
        * )
          tag="${default_gradle_version}"
          ;;
      esac
      echo "dockerTag=${tag}"
      export GRADLE_VERSION="${tag}"
  fi
}

# RUN
main "$@"
