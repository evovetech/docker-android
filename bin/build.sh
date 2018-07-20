#!/bin/bash

bin="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"
root="$( cd "${bin}/.." && pwd )"

source ${bin}/env.sh
${root}/hooks/build
