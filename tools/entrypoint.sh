#!/bin/bash

source "${TOOLS_DIR}/env.sh"
if [[ $# -eq 0 ]]; then
  help
  exit 0
fi

"$@"
