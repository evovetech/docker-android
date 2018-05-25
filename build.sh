#!/bin/bash

dir="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"

source ${dir}/env.sh
( cd ${dir}/hooks && ./build )
