#!/bin/bash

export ROOT_DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"

function main() {
  local default_gradle_version="gradle-4.10.1-all"

  local docker_tag
  if [[ -z "${DOCKER_TAG}" ]]; then
    docker_tag="${default_gradle_version}"
  else
    docker_tag="${DOCKER_TAG}"
  fi
  echo "default_docker_tag=${docker_tag}"

  case $docker_tag in
    gradle- )
      ## ignore
      ;;
    * )
      docker_tag="${default_gradle_version}"
      ;;
  esac
  export GRADLE_VERSION="${docker_tag}"
  echo "GRADLE_VERSION=${GRADLE_VERSION}"

  if [[ -z "${DOCKER_TAG}" ]]; then
    export DOCKER_TAG="${GRADLE_VERSION}"
  fi
  echo "DOCKER_TAG=${DOCKER_TAG}"

  if [[ -z "${DOCKER_REPO}" ]]; then
    export DOCKER_REPO="evovetech/android"
  fi

  if [[ -z "${DOCKERFILE_PATH}" ]]; then
    export DOCKERFILE_PATH="${ROOT_DIR}/Dockerfile"
  fi

  if [[ -z "${IMAGE_NAME}" ]]; then
    export IMAGE_NAME="${DOCKER_REPO}:${DOCKER_TAG}"
  fi
}

# RUN
main "$@"
