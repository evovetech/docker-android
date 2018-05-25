#!/bin/bash

dir="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"
source ${dir}/hooks/__env.sh
( cd ${dir}/hooks && ./build )
