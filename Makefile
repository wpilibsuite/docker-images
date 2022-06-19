UBUNTU?=20.04

IMAGES = \
	ubuntu-base:${UBUNTU} \
	roborio-cross-ubuntu:2022-${UBUNTU} \
	raspbian-cross-ubuntu:10-${UBUNTU} \
	aarch64-cross-ubuntu:bionic-${UBUNTU} \
	gazebo-ubuntu:${UBUNTU}

usage:
	@echo "Usage: make [command]"
	@echo "Commands:"
	@echo "	update"
	@echo "	build"
	@echo "	tag"
	@echo "	push"

update:
	docker pull ubuntu:${UBUNTU}

build:
	cd ubuntu-base && docker build -t wpilib/ubuntu-base:${UBUNTU} -f Dockerfile.${UBUNTU} .
	cd roborio-cross-ubuntu && \
	    docker build -t wpilib/roborio-cross-ubuntu:2022-${UBUNTU} -f Dockerfile.2022 --build-arg UBUNTU=${UBUNTU} .
	cd raspbian-cross-ubuntu && \
	    docker build -t wpilib/raspbian-cross-ubuntu:10-${UBUNTU} -f Dockerfile.10 --build-arg UBUNTU=${UBUNTU} .
	cd aarch64-cross-ubuntu && \
	    docker build -t wpilib/aarch64-cross-ubuntu:bionic-${UBUNTU} -f Dockerfile.bionic --build-arg UBUNTU=${UBUNTU} .
	cd gazebo-ubuntu && docker build -t wpilib/gazebo-ubuntu:${UBUNTU} --build-arg UBUNTU=${UBUNTU} .

tag:
	for i in $(IMAGES); do \
		docker tag wpilib/$$i docker.io/wpilib/$$i || exit; \
		docker tag wpilib/$$i ghcr.io/wpilib/$$i || exit; \
	done

push:
	for i in $(IMAGES); do \
		docker push docker.io/wpilib/$$i || exit; \
		docker push ghcr.io/wpilib/$$i || exit; \
	done
