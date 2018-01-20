#!/bin/bash

source "${ANDROID_INSTALL_TOOLS}/env.sh"
if [[ $# -eq 0 ]]; then
  help
  exit 0
fi

"$@"
