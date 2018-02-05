FROM evovetech/android:gradle

WORKDIR ${HOME}
COPY --chown=android:android tools/entrypoint.sh ./entrypoint.sh
ENTRYPOINT ["./entrypoint.sh"]
