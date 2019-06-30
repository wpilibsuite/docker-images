FROM wpilib/ubuntu-base:18.04

RUN apt-get update && apt-get install -y tzdata && apt-get install -y \
    gazebo9 \
    libgazebo9-dev \
    libprotobuf-dev \
    protobuf-compiler \
  && rm -rf /var/lib/apt/lists/*

WORKDIR /
