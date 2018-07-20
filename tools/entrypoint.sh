#!/bin/bash

source "${ANDROID_ROOT}/tools/env.sh"
if [[ $# -eq 0 ]]; then
  help
  exit 0
fi

"$@"
