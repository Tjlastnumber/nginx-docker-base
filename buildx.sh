#!/bin/sh

NAME=nginx-base
TAG=1.26.0
SHA=$(git rev-parse HEAD | cut -c 1-8)

echo ${NAME}:${TAG}_${SHA}

docker buildx build \
  --build-arg="GIT_SHA=${SHA}" \
	--platform linux/amd64,linux/arm64 \
	-t /${NAME}:${TAG}_${SHA} \
	--push .
