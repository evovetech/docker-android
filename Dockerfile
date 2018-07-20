# Gradle Image
ARG GRADLE_VERSION=gradle-4.5.1
FROM evovetech/android/gradle:${GRADLE_VERSION} as gradle_image

# Android Sdk Image
FROM evovetech/android/sdk:latest as android_image

# Main Image
FROM evovetech/android/base:latest

ENV HOME=/root \
    GRADLE_HOME=/root/.gradle \
    ANDROID_ROOT=/root/android

# Copy Gradle
COPY --from=gradle_image "${GRADLE_HOME}" "${GRADLE_HOME}"
VOLUME "${GRADLE_HOME}"

# Copy Android Sdk
COPY --from=android_image "${ANDROID_ROOT}" "${ANDROID_ROOT}"
VOLUME "${ANDROID_ROOT}/sdk"

#
WORKDIR "${HOME}"
COPY tools .
ENTRYPOINT ["./entrypoint.sh"]

# Update sdk on build
ONBUILD ARG INSTALL_PACKAGES_FILE=default-packages.txt
ONBUILD RUN ./install.sh ${INSTALL_PACKAGES_FILE}
