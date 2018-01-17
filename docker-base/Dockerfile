FROM openjdk:8-jdk-alpine

ARG GLIBC_VERSION="2.26-r0"

# Install Required Tools
RUN apk -U update && apk -U add \
  bash \
  ca-certificates \
  curl \
  expect \
  git \
  libstdc++ \
  libgcc \
  su-exec \
  ncurses \
  unzip \
  wget \
  zlib \
  && wget https://raw.githubusercontent.com/sgerrand/alpine-pkg-glibc/master/sgerrand.rsa.pub -O /etc/apk/keys/sgerrand.rsa.pub \
	&& wget https://github.com/sgerrand/alpine-pkg-glibc/releases/download/${GLIBC_VERSION}/glibc-${GLIBC_VERSION}.apk -O /tmp/glibc.apk \
	&& wget https://github.com/sgerrand/alpine-pkg-glibc/releases/download/${GLIBC_VERSION}/glibc-bin-${GLIBC_VERSION}.apk -O /tmp/glibc-bin.apk \
	&& apk add /tmp/glibc.apk /tmp/glibc-bin.apk \
  && rm -rf /tmp/* \
	&& rm -rf /var/cache/apk/*

ENV ANDROID_INSTALL_ROOT /opt/android
ENV ANDROID_INSTALL_TOOLS ${ANDROID_INSTALL_ROOT}/tools
ENV ANDROID_INSTALL_LICENSES ${ANDROID_INSTALL_ROOT}/licenses
ENV ANDROID_HOME ${ANDROID_INSTALL_ROOT}/sdk

# Copy Licenses
COPY licenses ${ANDROID_INSTALL_LICENSES}

# Bootstrap
COPY tools/android-env.sh ${ANDROID_INSTALL_TOOLS}/android-env.sh
COPY tools/android-sdkmanager.sh ${ANDROID_INSTALL_TOOLS}/android-sdkmanager.sh
COPY tools/bootstrap.sh ${ANDROID_INSTALL_TOOLS}/bootstrap.sh
RUN ${ANDROID_INSTALL_TOOLS}/bootstrap.sh

# Copy rest of tools
COPY tools ${ANDROID_INSTALL_TOOLS}

# Install
RUN ${ANDROID_INSTALL_TOOLS}/install.sh
VOLUME ${ANDROID_INSTALL_ROOT}
