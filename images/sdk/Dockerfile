ARG DOCKER_REPO
FROM ${DOCKER_REPO}/base

# Setup
ARG HOME
WORKDIR HOME
ENV ANDROID_HOME=${HOME}/sdk \
    ANDROID_TOOLS_DIR=${HOME}/sdk-tools \
    ANDROID_LICENSES_DIR=${HOME}/sdk-licenses

# Bootstrap
COPY bootstrap.sh ${HOME}/bootstrap.sh
RUN ${HOME}/bootstrap.sh \
    && rm -rf ${HOME}/bootstrap.sh

# Copy Licenses & Tools
COPY licenses ${ANDROID_LICENSES_DIR}
COPY tools ${ANDROID_TOOLS_DIR}

# Install
RUN ${ANDROID_TOOLS_DIR}/install.sh \
    && rm -rf ${ANDROID_TOOLS_DIR}/install.sh \
    && rm -rf ${ANDROID_TOOLS_DIR}/package-list.sh

# MicroBadger
LABEL \
    org.label-schema.vcs-url="https://github.com/evovetech/docker-android" \
    org.label-schema.schema-version="1.0"
