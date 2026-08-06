#!/bin/bash

set -ex

docker login
docker build -t cgialus/alus-noble-cuda-12-devel:latest -f dev.Dockerfile .
docker tag cgialus/alus-noble-cuda-12-devel:latest cgialus/alus-noble-cuda-12-devel:latest
docker push cgialus/alus-noble-cuda-12-devel:latest
