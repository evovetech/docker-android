FROM evovetech/android-gradle

COPY --chown=android:android tools/entrypoint.sh ./entrypoint.sh
ENTRYPOINT ["./entrypoint.sh"]
VOLUME ${ANDROID_HOME}
VOLUME ${GRADLE_HOME}
