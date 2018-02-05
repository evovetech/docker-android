ARG DOCKER_REPO=evovetech/android
ARG CACHE_TAG=latest
FROM ${DOCKER_REPO}:gradle.${CACHE_TAG}

WORKDIR ${HOME}
COPY tools/entrypoint.sh ./entrypoint.sh
ENTRYPOINT ["./entrypoint.sh"]
