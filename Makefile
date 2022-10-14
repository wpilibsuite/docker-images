UBUNTU?=22.04

usage:
	@echo "Run make update, make build, and make push"

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
	cd opensdk-ubuntu && \
		docker build -t wpilib/opensdk-ubuntu:${UBUNTU} -f Dockerfile.${UBUNTU} .
	cd gazebo-ubuntu && docker build -t wpilib/gazebo-ubuntu:${UBUNTU} --build-arg UBUNTU=${UBUNTU} .

push:
	docker push wpilib/ubuntu-base:${UBUNTU}
	docker push wpilib/roborio-cross-ubuntu:2022-${UBUNTU}
	docker push wpilib/raspbian-cross-ubuntu:10-${UBUNTU}
	docker push wpilib/aarch64-cross-ubuntu:bionic-${UBUNTU}
	docker push wpilib/opensdk-ubuntu:${UBUNTU}
	docker push wpilib/gazebo-ubuntu:${UBUNTU}
