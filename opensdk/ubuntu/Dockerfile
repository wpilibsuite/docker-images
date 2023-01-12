ARG OPENSDK_UBUNTU
FROM ubuntu:${OPENSDK_UBUNTU}

ENV TZ=UTC
ENV DEBIAN_FRONTEND=noninteractive

RUN apt-get update && \
    apt-get install -y tzdata && \
    apt-get install -y \
    bison \
    crossbuild-essential-amd64 \
    crossbuild-essential-arm64 \
    crossbuild-essential-armhf \
    crossbuild-essential-riscv64 \
    flex \
    gawk \
    libgmp-dev \
    libisl-dev \
    libmpc-dev \
    libmpfr-dev \
    m4 \
    mingw-w64 \
    python3-dev \
    python3-pip \
    python3-setuptools \
    rsync \
    strip-nondeterminism \
    sudo \
    texinfo \
    wget \
    zip && \
  rm -rf /var/lib/apt/lists/*
