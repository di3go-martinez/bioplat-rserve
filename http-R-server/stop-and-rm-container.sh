#!/bin/bash

mode=${1}

if [ "x" == "x$mode" ]; then
  echo "Indicar el container a remover (dev | prod):"
  docker ps --format "{{.Names}}" | grep http-r-server
  exit 1
fi

container_name=http-r-server-$mode
docker stop $container_name && \
	docker rm $container_name
