FROM evovetech/android/base

# MicroBadger
LABEL \
    org.label-schema.vcs-url="https://github.com/evovetech/docker-android" \
    org.label-schema.schema-version="1.0"

# Setup
ENV ANDROID_ROOT="~/android"
RUN echo "Set ANDROID_HOME to ${ANDROID_ROOT}/sdk" \
    && mkdir -p "${ANDROID_ROOT}/sdk" \
    && echo "Bootstrapping SDK-Tools" \
    && wget -q https://dl.google.com/android/repository/sdk-tools-linux-4333796.zip -O sdk-tools-linux.zip \
    && unzip sdk-tools-linux.zip -d "${ANDROID_ROOT}/sdk" \
    && rm -rf sdk-tools-linux.zip


# Copy Licenses & Tools
COPY . "${ANDROID_ROOT}"

# Install
ONBUILD RUN ${ANDROID_ROOT}/tools/install.sh
