FROM ubuntu:22.04

RUN apt-get update && apt-get install -y apt-transport-https \
    ca-certificates \
    gnupg \
    software-properties-common \
    wget && \
    wget -O - https://apt.kitware.com/keys/kitware-archive-latest.asc 2>/dev/null | gpg --dearmor - | tee /etc/apt/trusted.gpg.d/kitware.gpg >/dev/null && \
    apt-add-repository 'deb https://apt.kitware.com/ubuntu/ jammy main' && \
    add-apt-repository ppa:git-core/ppa && \
    apt-get update && apt-get install -y tzdata && apt-get install -y \
    build-essential \
    ca-certificates \
    clang-format-14 \
    cmake \
    curl \
    fakeroot \
    g++ --no-install-recommends \
    gcc \
    gdb \
    git \
    java-common \
    libc6-dev \
    libgl1-mesa-dev \
    libglu1-mesa-dev \
    libisl-dev \
    libopencv-dev \
    libvulkan-dev \
    libx11-dev \
    libxcursor-dev \
    libxi-dev \
    libxinerama-dev \
    libxrandr-dev \
    make \
    mesa-common-dev \
    openjdk-17-jdk \
    python-all-dev \
    python3-dev \
    python3-pip \
    python3-setuptools \
    sudo \
    unzip \
    wget \
    zip \
  && rm -rf /var/lib/apt/lists/*

ENV JAVA_HOME /usr/lib/jvm/java-17-openjdk-amd64

WORKDIR /
