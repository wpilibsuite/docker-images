Docker images for building WPILib
=================================

These are the dockerfiles for the wpilib dockerhub repositories.

debian-base
 - Based on official debian repo (host)
 - Contains Java and C++ native tools required for WPILib development
 - Base image for cross-compiler images
 - Published as wpilib/debian-base:host debian codename (e.g. trixie)

debian-minimal-base
 - Based on official debian repo (host)
 - Base image for minimal cross-compiler images that only contain cross compiler
 - Published as wpilib/debian-minimal-base:host debian codename (e.g. trixie)

driverstation-base
 - Based on official debian repo (host)
 - Base image for building the Driver Station application
 - Published as wpilib/driverstation-base:arch (e.g. x64 or arm64)

opensdk-ubuntu
 - Based on official ubuntu repo (host)
 - Base image for building opensdk toolchains
 - Published as wpilib/opensdk-ubuntu:host ubuntu version (e.g. 24.04)

systemcore-cross-debian
 - Based on wpilib/debian-base
 - Cross-compiler for systemcore (Trixie for now)
 - Published as wpilib/systemcore-cross-debian:host debian codename
   (e.g. trixie)
 - Minimal variant published as wpilib/systemcore-cross-debian-minimal

aarch64-cross-debian
 - Based on wpilib/debian-base
 - Cross-compiler for aarch64 (TX2 and Nano)
 - Published as wpilib/aarch-cross-debian:host debian codename
   (e.g. trixie)
 - Minimal variant published as wpilib/aarch64-cross-debian-minimal

systemcore-cross-debian-pyXXX
- Based on the minimal cross compiler image
- Contains crossenv at /build/venv for cross-compiling python wheels
- Published as wpilib/systemcore-cross-debian:{debian}-py{pyversion}