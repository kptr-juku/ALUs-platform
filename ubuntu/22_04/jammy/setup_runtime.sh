#!/bin/bash

set -e

apt update && apt install -y --no-install-recommends \
    gdal-bin libgdal-dev \
    libboost-program-options-dev libboost-date-time-dev libboost-filesystem-dev libboost-iostreams-dev libboost-log-dev \
    zlib1g-dev
apt clean
rm -rf /var/lib/apt/lists/*
