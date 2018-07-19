ARG DOCKER_REPO
FROM ${DOCKER_REPO}/base

# Setup
USER root
ENV GRADLE_HOME=${HOME}/.gradle \
    GRADLE_INIT_DIR=${HOME}/gradle-init
COPY . ${GRADLE_INIT_DIR}
RUN chown -R android:android ${GRADLE_INIT_DIR}
USER android

# Install
ARG GRADLE_VERSION
RUN ${GRADLE_INIT_DIR}/tools/install.sh \
    && rm -rf ${GRADLE_INIT_DIR}

# Mark Volume
VOLUME ${GRADLE_HOME}

# MicroBadger
LABEL \
    org.label-schema.vcs-url="https://github.com/evovetech/docker-android" \
    org.label-schema.schema-version="1.0"
