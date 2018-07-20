#!/bin/bash

bin="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"
root="$( cd "${bin}/.." && pwd )"

export CACHE_TAG=latest
source ${bin}/env.sh
${root}/hooks/build
