FROM evovetech/android-base

ENV GRADLE_INIT_DIR=${HOME}/gradle-init \
    GRADLE_HOME=${HOME}/.gradle
COPY --chown=android:android . ${GRADLE_INIT_DIR}
RUN ${GRADLE_INIT_DIR}/tools/install.sh
