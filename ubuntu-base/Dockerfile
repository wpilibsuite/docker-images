FROM ubuntu:18.04

RUN apt-get update && apt-get install -y tzdata && apt-get install -y \
    build-essential \
    ca-certificates \
    cmake \
    curl \
    fakeroot \
    g++ --no-install-recommends \
    gcc \
    gdb \
    git \
    java-common \
    libc6-dev \
    libisl15 \
    libopencv-dev \
    libvulkan-dev \
    libx11-dev \
    libxcursor-dev \
    libxi-dev \
    libxinerama-dev \
    libxrandr-dev \
    make \
    mesa-common-dev \
    openjdk-11-jdk \
    python-all-dev \
    python3-dev \
    python3-pip \
    python3-setuptools \
    sudo \
    unzip \
    wget \
    zip \
  && wget https://apt.llvm.org/llvm.sh && chmod +x llvm.sh && ./llvm.sh 10 \
  && apt-get install -y clang-format-10
  && rm -rf /var/lib/apt/lists/*

ENV JAVA_HOME /usr/lib/jvm/java-11-openjdk-amd64

WORKDIR /
