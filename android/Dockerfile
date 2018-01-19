FROM evovetech/android-base

ENV GRADLE_INIT_DIR=/home/android/gradle-init \
    GRADLE_HOME=/home/android/.gradle
COPY --chown=android:android . ${GRADLE_INIT_DIR}
WORKDIR ${GRADLE_INIT_DIR}
RUN tools/install.sh
