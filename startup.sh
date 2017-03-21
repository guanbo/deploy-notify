#!/usr/bin/env bash

HOST=notify.fankahui.com
CONTAINER=notify
VPATH=$(pwd)/conf.d/:/etc/nginx/conf.d

docker rm -f $CONTAINER
docker run -d \
    --name $CONTAINER\
    -e "VIRTUAL_HOST="$HOST \
    -e "VIRTUAL_NETWORK=nginx-proxy" \
    -e "VIRTUAL_PORT=80" \
    -e "LETSENCRYPT_HOST="$HOST \
    -e "LETSENCRYPT_EMAIL=guanbo2002@gmail.com" \
    --network nginx-proxy \
    -v $VPATH \
    nginx