#!/bin/sh
set -e

CONTAINER_NAME=bind-lab
IMAGENAME=bind-lab
CONTAINER_FE=docker  # or CONTAINER_FE=podman

$CONTAINER_FE container stop ${CONTAINER_NAME} > /dev/null 2>&1 || true
$CONTAINER_FE container rm ${CONTAINER_NAME} > /dev/null 2>&1 || true

$CONTAINER_FE build -t $IMAGENAME --rm=true --force-rm=true --no-cache .
echo ""
echo "Start your container with the command:"
echo ""
echo "$CONTAINER_FE run --name ${CONTAINER_NAME} -d -v ${CONTAINER_NAME}-etc:/etc/bind  -v ${CONTAINER_NAME}-bind:/var/lib/bind -p 53:53/udp -p 53:53/tcp ${IMAGENAME}"


