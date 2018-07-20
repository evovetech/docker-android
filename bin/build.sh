#!/bin/bash

bin="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"
root="${bin}/.."

source ${bin}/env.sh
${root}/hooks/build
