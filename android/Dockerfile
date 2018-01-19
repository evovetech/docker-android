FROM evovetech/android-base

ENV GRADLE_INIT_DIR=/home/android/gradle-init \
    GRADLE_HOME=/home/android/.gradle
COPY . ${GRADLE_INIT_DIR}
WORKDIR ${GRADLE_INIT_DIR}
USER root
RUN chown -R android:android ${GRADLE_INIT_DIR}
USER android
RUN tools/install.sh
