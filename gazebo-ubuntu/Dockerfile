ARG UBUNTU=22.04
FROM wpilib/ubuntu-base:${UBUNTU}

RUN apt-get update && apt-get install -y tzdata && apt-get install -y \
    gazebo \
    libgazebo-dev \
    libprotobuf-dev \
    protobuf-compiler \
  && rm -rf /var/lib/apt/lists/*

WORKDIR /
