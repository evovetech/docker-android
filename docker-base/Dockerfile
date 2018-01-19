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

ENV ANDROID_INSTALL_ROOT=/opt/android
ENV ANDROID_INSTALL_TOOLS=${ANDROID_INSTALL_ROOT}/tools \
    ANDROID_HOME=${ANDROID_INSTALL_ROOT}/sdk \
    ANDROID_INSTALL_LICENSES=${ANDROID_INSTALL_ROOT}/licenses

# Bootstrap
RUN addgroup android \
    && adduser -D -S -G android android \
    && mkdir -p ${ANDROID_INSTALL_ROOT} \
    && chown -R android:android ${ANDROID_INSTALL_ROOT}
COPY --chown=android:android tools/bootstrap.sh ${ANDROID_INSTALL_TOOLS}/bootstrap.sh
USER android
RUN ${ANDROID_INSTALL_TOOLS}/bootstrap.sh

# Copy Licenses
COPY --chown=android:android licenses ${ANDROID_INSTALL_LICENSES}

# Copy rest of tools
COPY --chown=android:android tools ${ANDROID_INSTALL_TOOLS}

# Install
RUN ${ANDROID_INSTALL_TOOLS}/install.sh
