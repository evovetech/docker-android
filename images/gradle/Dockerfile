FROM evovetech/android-base

# MicroBadger
LABEL \
    org.label-schema.vcs-url="https://github.com/evovetech/docker-android" \
    org.label-schema.schema-version="1.0"

# Setup
ENV GRADLE_HOME="/root/.gradle"
COPY . "/root/temp"

# Install
ARG GRADLE_VERSION
RUN "/root/temp/tools/install.sh" \
    && rm -rf "/root/temp"
