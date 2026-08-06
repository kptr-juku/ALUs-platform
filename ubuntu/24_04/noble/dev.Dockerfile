FROM ubuntu:24.04

# for tzdata installation - https://askubuntu.com/questions/909277/avoiding-user-interaction-with-tzdata-when-installing-certbot-in-a-docker-contai
ENV DEBIAN_FRONTEND=noninteractive

COPY install_cuda_base.sh .
RUN ./install_cuda_base.sh
COPY setup_runtime.sh .
RUN ./setup_runtime.sh
COPY setup_dev.sh .
RUN ./setup_dev.sh

ENV NVIDIA_VISIBLE_DEVICES=all
ENV NVIDIA_DRIVER_CAPABILITIES=compute,utility
ENV LD_LIBRARY_PATH=/usr/local/cuda-12/lib64
ENV PATH=/usr/local/cuda-12/bin:${PATH}
