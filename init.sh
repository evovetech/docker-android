#!/bin/bash

source env.sh

url="https://raw.githubusercontent.com/themattrix/bash-concurrent"
version="2.4.0"
name="${CONCURRENT_LIB}"
out="${BIN_DIR}/${name}"

// download
curl "${url}/${version}/${name}" > "${out}"
