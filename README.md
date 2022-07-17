Docker images for building WPILib
=================================

These are the dockerfiles for the wpilib dockerhub repositories.

| Container Name | Container Base | Notes |
|-|-|-|
| `ubuntu-base` | Ubuntu 20.04 | A generic container all other containers are built on. Includes Java and C++ native tools. |
| `aarch64-cross-ubuntu` | `ubuntu-base` | Cross-compiler environment for the Nvidia Jetson (Ubuntu 18.04 arm64). |
| `roborio-cross-ubuntu` | `ubuntu-base` | Cross-compiler environment for the National Instruments RoboRIO. |
| `raspbian-cross-ubuntu` | `ubuntu-base` | Cross-compiler environment for the Raspberry Pi (armhf). |
| `gazebo-ubuntu` | `ubuntu-base` | Packages gazebo and protobuf for building plugins. |
| `opensdk-ubuntu` | `ubuntu-base` | Packages for building toolchains in OpenSDK. |
