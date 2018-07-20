#!/bin/bash

cd "$( dirname "${BASH_SOURCE[0]}" )"

# build
source env.sh
./build.sh

# push
docker push "${IMAGE_NAME}"
hooks/post_push
