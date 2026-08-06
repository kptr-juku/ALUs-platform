#!/bin/bash

set -e

apt-get update
apt-get install -y --no-install-recommends ca-certificates wget gcc g++
# From https://developer.nvidia.com/cuda-downloads
wget -q https://developer.download.nvidia.com/compute/cuda/repos/ubuntu2404/x86_64/cuda-keyring_1.1-1_all.deb
dpkg -i cuda-keyring_1.1-1_all.deb
rm cuda-keyring_1.1-1_all.deb
apt-get update

cuda_version_suffix=$(apt-cache depends cuda-toolkit-12 | awk '/Depends: cuda-toolkit-12-[0-9]+/ { sub("cuda-toolkit-", "", $2); print $2; exit }')
if [ -z "$cuda_version_suffix" ]; then
    echo "Failed to determine latest CUDA 12 toolkit version" >&2
    exit 1
fi

# Use cuda-toolkit-12 only to resolve the latest CUDA 12 minor version. Installing it directly also pulls
# documentation, samples, Nsight, and extra tools; compiler + libraries-dev keeps the full SDK libraries.
apt-get install -y --no-install-recommends \
    "cuda-compiler-${cuda_version_suffix}" \
    "cuda-libraries-dev-${cuda_version_suffix}"
apt-get clean
rm -rf /var/lib/apt/lists/*

echo "" >> ~/.bashrc
echo 'export LD_LIBRARY_PATH=/usr/local/cuda-12/lib64/:$LD_LIBRARY_PATH' >> ~/.bashrc
echo 'export PATH=/usr/local/cuda-12/bin/:$PATH' >> ~/.bashrc
