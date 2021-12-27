FROM ubuntu:20.04

ENV DEBIAN_FRONTEND=noninteractive

COPY ./rvos_tools/ /
COPY ./sources.list /etc/apt/sources.list 
RUN  apt-get update && apt-get install -y build-essential gcc make perl dkms  libsnappy1v5 libsdl2-2.0-0 libvdeplug2 librbd1 libaio1  libfdt1/focal  libpixman-1-0  libglib2.0-0 libpng-dev liblzo2-dev
# you can add unecessary tools as you like:  vim git
ENV PATH=/tools/gcc/bin:/tools/qemu/bin:$PATH
ENV CROSS_COMPILE=riscv64-unknown-elf-
WORKDIR /root/
