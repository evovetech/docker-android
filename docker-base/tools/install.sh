#!/bin/bash

addgroup android
adduser android -D -S -G android -h "${ANDROID_INSTALL_ROOT}"
chown -R android:android "${ANDROID_INSTALL_ROOT}"
exec su-exec android:android "${ANDROID_INSTALL_TOOLS}/android-sdk-install.sh"
