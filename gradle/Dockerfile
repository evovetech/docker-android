FROM evovetech/android

VAR GRADLE_INIT_DIR=${HOME}/gradle-init
ENV GRADLE_HOME=${HOME}/.gradle
COPY . ${GRADLE_INIT_DIR}
RUN chown -R android:android ${GRADLE_INIT_DIR}
RUN ${GRADLE_INIT_DIR}/tools/install.sh \
    && rm -rf ${GRADLE_INIT_DIR}
