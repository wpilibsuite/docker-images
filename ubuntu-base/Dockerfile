FROM ubuntu:18.04

RUN apt-get update && apt-get install -y tzdata && apt-get install -y \
    build-essential \
    ca-certificates \
    clang-format-6.0 \
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
    openjdk-11-jdk \
    make \
    libopencv-dev \
    python-all-dev \
    python3-dev \
    python3-pip \
    python3-setuptools \
    sudo \
    unzip \
    wget \
    zip \
  && rm -rf /var/lib/apt/lists/*

ENV JAVA_HOME /usr/lib/jvm/java-11-openjdk-amd64

WORKDIR /