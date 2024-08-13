#!/bin/sh

DOCKER_HUB_PROJECT=snowdreamtech/php

GITHUB_PROJECT=ghcr.io/snowdreamtech/php

docker buildx build --platform=linux/386,linux/amd64,linux/arm/v6,linux/arm/v7,linux/arm64,linux/ppc64le,linux/riscv64,linux/s390x \
-t ${DOCKER_HUB_PROJECT}:fpm-nginx-latest \
-t ${DOCKER_HUB_PROJECT}:fpm-8.1.29-nginx-1.26.1 \
-t ${DOCKER_HUB_PROJECT}:fpm-8.1-nginx-1.26 \
-t ${DOCKER_HUB_PROJECT}:fpm-8-nginx-1 \
-t ${GITHUB_PROJECT}:fpm-nginx-latest \
-t ${GITHUB_PROJECT}:fpm-8.1.29-nginx-1.26.1 \
-t ${GITHUB_PROJECT}:fpm-8.1-nginx-1.26 \
-t ${GITHUB_PROJECT}:fpm-8-nginx-1 \
. \
--push
