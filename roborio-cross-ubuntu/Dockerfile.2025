ARG UBUNTU=22.04
ARG TYPE=base
FROM wpilib/ubuntu-${TYPE}:${UBUNTU}

# Install toolchain
RUN curl -SL https://github.com/wpilibsuite/opensdk/releases/download/v2024-1/cortexa9_vfpv3-roborio-academic-2024-x86_64-linux-gnu-Toolchain-12.1.0.tgz | sh -c 'mkdir -p /usr/local && cd /usr/local && tar xzf - --strip-components=2'

WORKDIR /
