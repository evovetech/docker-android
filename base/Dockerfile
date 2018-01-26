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

ENV ROOT_DIR=/home/android
ENV HOME=${ROOT_DIR} \
    ANDROID_HOME=${ROOT_DIR}/sdk \
    TOOLS_DIR=${ROOT_DIR}/tools \
    LICENSES_DIR=${ROOT_DIR}/licenses

# Bootstrap
RUN addgroup android \
    && adduser -D -S -G android -h ${HOME} android
USER android
COPY --chown=android:android tools/bootstrap.sh ${TOOLS_DIR}/bootstrap.sh
RUN ${TOOLS_DIR}/bootstrap.sh

# Copy Licenses
COPY --chown=android:android licenses ${LICENSES_DIR}

# Copy rest of tools
COPY --chown=android:android tools ${TOOLS_DIR}

# Install
RUN ${TOOLS_DIR}/install.sh
