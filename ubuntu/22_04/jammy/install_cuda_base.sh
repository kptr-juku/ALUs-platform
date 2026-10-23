#!/bin/bash

set -e

apt-get update
apt-get install -y --no-install-recommends ca-certificates wget gcc g++
# From https://developer.nvidia.com/cuda-downloads
wget -q https://developer.download.nvidia.com/compute/cuda/repos/ubuntu2204/x86_64/cuda-keyring_1.1-1_all.deb
dpkg -i cuda-keyring_1.1-1_all.deb
rm cuda-keyring_1.1-1_all.deb
apt-get update

# CUDA 12.9 supports the release's Pascal through Blackwell targets. Compiler + libraries-dev
# provides the SDK without installing a driver, documentation, samples or Nsight.
apt-get install -y --no-install-recommends cuda-compiler-12-9 cuda-libraries-dev-12-9
apt-get clean
rm -rf /var/lib/apt/lists/*

echo "" >> ~/.bashrc
echo 'export LD_LIBRARY_PATH=/usr/local/cuda-12/lib64/:$LD_LIBRARY_PATH' >> ~/.bashrc
echo 'export PATH=/usr/local/cuda-12/bin/:$PATH' >> ~/.bashrc
