#!/bin/bash

default_gradle_version="gradle-4.5.1"

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
  bin="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"
  root="$( cd "${bin}/.." && pwd )"
  export DOCKERFILE_PATH="${root}/Dockerfile"
fi

if [[ -z "${CACHE_TAG}" ]]; then
  setGradleVersion
  export CACHE_TAG="${GRADLE_VERSION}"
else
  setGradleVersion
fi
