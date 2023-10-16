Docker images for building WPILib
=================================

These are the dockerfiles for the wpilib dockerhub repositories.

ubuntu-base
 - Based on official ubuntu repo (host)
 - Contains Java and C++ native tools required for WPILib development
 - Base image for cross-compiler images
 - Published as wpilib/ubuntu-base:host ubuntu version (e.g. 18.04)

ubuntu-minimal-base
 - Based on official ubuntu repo (host)
 - Base image for minimal cross-compiler images that only contain cross compiler
 - Published as wpilib/ubuntu-minimal-base:host ubuntu version (e.g. 18.04)

roborio-cross-ubuntu
 - Based on wpilib/ubuntu-base
 - Cross-compiler for roboRIO
 - Published as wpilib/roborio-cross-ubuntu:frc season-host ubuntu version
   (e.g. 2020-18.04)
 - Minimal variant published as roborio-cross-ubuntu-minimal

raspbian-cross-ubuntu
 - Based on wpilib/ubuntu-base
 - Cross-compiler for Raspbian
 - Published as wpilib/raspbian-cross-ubuntu:target version-host ubuntu version
   (e.g. 10-18.04)
 - Minimal variant published as raspbian-cross-ubuntu-minimal

aarch64-cross-ubuntu
 - Based on wpilib/ubuntu-base
 - Cross-compiler for aarch64 (TX2 and Nano)
 - Published as wpilib/aarch-cross-ubuntu:target version-host ubuntu version
   (e.g. bionic-18.04)
 - Minimal variant published as raspbian-cross-ubuntu-aarch64

gazebo-ubuntu
 - Based on wpilib/ubuntu-base
 - Installs gazebo and protobuf required to build gazebo plugins
 - Published as wpilib/gazebo-ubuntu:host ubuntu version (e.g. 18.04)
