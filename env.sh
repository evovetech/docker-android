#!/bin/bash

echo '  $ printenv :'
printenv
echo ''
echo ''

default_gradle_version="gradle-4.9"

function defaultCacheTag() {
    if [[ -z "${CACHE_TAG}" ]]; then
      printf "${default_gradle_version}"
    else
      printf "${CACHE_TAG}"
    fi
}

function setGradleVersion() {
  if [[ -z "${GRADLE_VERSION}" ]]; then
      local tag="$( defaultCacheTag )"
      echo "defaultCacheTag=${tag}"
      case $tag in
        gradle- )
          ## ignore
          ;;
        * )
          tag="${default_gradle_version}"
          ;;
      esac
      echo "cacheTag=${tag}"
      export GRADLE_VERSION="${tag}"
  fi
}

if [[ -z "${DOCKERFILE_PATH}" ]]; then
  root="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"
  export DOCKERFILE_PATH="${root}/Dockerfile"
fi

if [[ -z "${CACHE_TAG}" ]]; then
  setGradleVersion
  export CACHE_TAG="${GRADLE_VERSION}"
else
  setGradleVersion
fi

if [[ -z "${DOCKER_REPO}" ]]; then
  export DOCKER_REPO="evovetech/android"
fi

if [[ -z "${IMAGE_NAME}" ]]; then
  export IMAGE_NAME="${DOCKER_REPO}:${CACHE_TAG}"
fi
