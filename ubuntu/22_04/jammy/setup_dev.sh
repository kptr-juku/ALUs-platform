#!/bin/bash

set -e

apt update
apt install -y cmake git build-essential
apt install -y clang clang-format clang-tidy libeigen3-dev unzip parallel
apt install -y python3-venv python3-pip python3-gdal python3-tk
apt install -y libssl-dev
apt clean
rm -rf /var/lib/apt/lists/*
