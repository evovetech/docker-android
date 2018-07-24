# Gradle Image
ARG GRADLE_VERSION
FROM evovetech/android-gradle:${GRADLE_VERSION} as gradle_image

# Android Sdk Image
FROM evovetech/android-sdk as android_image

# Main Image
FROM evovetech/android-base

ENV HOME=/root \
    GRADLE_HOME=/root/.gradle \
    ANDROID_ROOT=/root/android

# Copy Gradle
COPY --from=gradle_image "${GRADLE_HOME}" "${GRADLE_HOME}"

# Copy Android Sdk
COPY --from=android_image "${ANDROID_ROOT}" "${ANDROID_ROOT}"

#
WORKDIR "${HOME}"
COPY tools .
ENTRYPOINT ["./entrypoint.sh"]

# Update sdk on build
ONBUILD ARG INSTALL_PACKAGE_LIST
ONBUILD RUN ./install.sh ${INSTALL_PACKAGE_LIST}
ONBUILD VOLUME "${ANDROID_ROOT}/sdk"
ONBUILD VOLUME "${GRADLE_HOME}"
