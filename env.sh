#!/bin/bash

default_gradle_version="gradle-4.1"
function defaultCacheTag() {
    if [[ -z "${CACHE_TAG}" ]]; then
      print "${default_gradle_version}"
    else
      print "${CACHE_TAG}"
    fi
}
function setGradleVersion() {
  if [[ -z "${GRADLE_VERSION}" ]]; then
      local tag="$( defaultCacheTag )"
      case $tag in
        gradle- )
          ## ignore
          ;;
        * )
          tag="${default_gradle_version}"
          ;;
      esac
      export GRADLE_VERSION="${tag}"
  fi
}

if [[ -z "${DOCKERFILE_PATH}" ]]; then
  export DOCKERFILE_PATH="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"
fi
if [[ -z "${DOCKER_REPO}" ]]; then
  export DOCKER_REPO="evovetech/android"
fi
if [[ -z "${BASE_IMAGE_TAG}" ]]; then
  export BASE_IMAGE_TAG="latest"
fi
if [[ -z "${CACHE_TAG}" ]]; then
  setGradleVersion
  export CACHE_TAG="${GRADLE_VERSION}"
else
  setGradleVersion
fi

GIT_REF="$( git rev-parse --short HEAD)"
GIT_URL="https://github.com/evovetech/docker-android"

read -d '' DOCKER_CMD <<"EOF"
'
# Run container with volumes
docker run -it --rm \
    --mount type=volume,source=android-sdk,destination=/home/android/sdk \
    --mount type=volume,source=gradle-home,destination=/home/android/.gradle \
    --net=host \
    evovetech/android "$@"
'
EOF