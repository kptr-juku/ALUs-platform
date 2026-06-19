#!/bin/bash

set -ex

docker login
docker build -t cgialus/alus-noble-devel:latest -f dev.Dockerfile .
docker tag cgialus/alus-noble-devel:latest cgialus/alus-noble-devel:latest
docker push cgialus/alus-noble-devel:latest
