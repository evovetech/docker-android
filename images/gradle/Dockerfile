ARG DOCKER_REPO=evovetech/android
ARG BASE_IMAGE_TAG=latest
FROM ${DOCKER_REPO}:base.${BASE_IMAGE_TAG}

USER root
ENV GRADLE_HOME=${HOME}/.gradle \
    GRADLE_INIT_DIR=${HOME}/gradle-init
COPY . ${GRADLE_INIT_DIR}
RUN chown -R android:android ${GRADLE_INIT_DIR}
USER android
ARG GRADLE_VERSION
RUN ${GRADLE_INIT_DIR}/tools/install.sh \
    && rm -rf ${GRADLE_INIT_DIR}
