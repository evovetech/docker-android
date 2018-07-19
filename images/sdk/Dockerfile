ARG DOCKER_REPO
FROM ${DOCKER_REPO}/base

# Setup
ENV ROOT_DIR=/home/android
ENV HOME=${ROOT_DIR} \
    ANDROID_HOME=${ROOT_DIR}/sdk \
    TOOLS_DIR=${ROOT_DIR}/tools \
    LICENSES_DIR=${ROOT_DIR}/licenses

# Bootstrap
RUN addgroup android \
    && adduser -D -S -G android -h ${HOME} android
COPY bootstrap.sh ${HOME}/bootstrap.sh
RUN ${HOME}/bootstrap.sh \
    && rm -rf ${HOME}/bootstrap.sh

# Copy Licenses & Tools
COPY licenses ${LICENSES_DIR}
COPY tools ${TOOLS_DIR}

# Install
RUN ${TOOLS_DIR}/install.sh \
    && rm -rf ${TOOLS_DIR}/install.sh \
    && rm -rf ${TOOLS_DIR}/package-list.sh

# Permissions
RUN chown -R android:android ${HOME}
USER android

# Update on build
ONBUILD RUN ${TOOLS_DIR}/update.sh \
    && rm -rf ${TOOLS_DIR}/update.sh

# Mark Volume
VOLUME ${ANDROID_HOME}

# MicroBadger
LABEL \
    org.label-schema.vcs-url="https://github.com/evovetech/docker-android" \
    org.label-schema.schema-version="1.0"
