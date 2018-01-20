FROM evovetech/android-gradle

COPY --chown=android:android tools ${ANDROID_INSTALL_TOOLS}
WORKDIR ${ANDROID_INSTALL_TOOLS}
ENTRYPOINT ["./entrypoint.sh"]
VOLUME ${ANDROID_HOME}
VOLUME ${GRADLE_HOME}
