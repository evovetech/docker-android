FROM evovetech/android

USER root
ENV GRADLE_HOME=${HOME}/.gradle \
    GRADLE_INIT_DIR=${HOME}/gradle-init
COPY . ${GRADLE_INIT_DIR}
RUN chown -R android:android ${GRADLE_INIT_DIR}
USER android
RUN ${GRADLE_INIT_DIR}/tools/install.sh \
    && rm -rf ${GRADLE_INIT_DIR}
