#!/bin/bash

IMAGE=${IMAGE:-jbergstroem/mariadb-alpine}
SHORT_SHA=$(git rev-parse --short HEAD)
DATE=$(date -u +"%Y-%m-%dT%H:%M:%SZ")
VERSION=${VERSION:-${SHORT_SHA}}

docker buildx build \
    --platform linux/amd64,linux/arm64 \
	--build-arg BUILD_DATE="${DATE}" \
    --build-arg VCS_REF="${SHORT_SHA}" \
    -t "${IMAGE}:${VERSION}" .
