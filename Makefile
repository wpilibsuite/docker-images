UBUNTU?=20.04
DEBIAN?=bullseye

usage:
	@echo "Run make update, make build, and make push"

update: update-ubuntu update-debian

update-ubuntu:
	docker pull ubuntu:${UBUNTU}

update-debian:
	docker pull debian:${DEBIAN}

build: build-debian build-ubuntu

build-ubuntu:
	cd base-ubuntu && docker build -t wpilib/ubuntu-base:${UBUNTU} -f Dockerfile.${UBUNTU} .
	cd roborio-cross-ubuntu && \
	    docker build -t wpilib/roborio-cross-ubuntu:2022-${UBUNTU} -f Dockerfile.2022 --build-arg UBUNTU=${UBUNTU} .
	cd raspbian-cross-ubuntu && \
	    docker build -t wpilib/raspbian-cross-ubuntu:10-${UBUNTU} -f Dockerfile.10 --build-arg UBUNTU=${UBUNTU} .
	cd aarch64-cross-ubuntu && \
	    docker build -t wpilib/aarch64-cross-ubuntu:bionic-${UBUNTU} -f Dockerfile.bionic --build-arg UBUNTU=${UBUNTU} .
	cd opensdk-ubuntu && \
		docker build -t wpilib/opensdk-ubuntu:${UBUNTU} -f Dockerfile.${UBUNTU} .
	cd gazebo-ubuntu && docker build -t wpilib/gazebo-ubuntu:${UBUNTU} --build-arg UBUNTU=${UBUNTU} .

build-debian:
	cd base-debian && docker build -t wpilib/debian-base:${DEBIAN} \
		--build-arg BASE_IMAGE=debian:${DEBIAN} .
	cd opensdk-debian && docker build -t wpilib/opensdk-ubuntu:${DEBIAN} \
		--build-arg BASE_IMAGE=debian:${DEBIAN} \
		--build-arg DEBIAN=${DEBIAN} .

push: push-ubuntu push-debian

push-ubuntu:
	docker push wpilib/ubuntu-base:${UBUNTU}
	docker push wpilib/roborio-cross-ubuntu:2022-${UBUNTU}
	docker push wpilib/raspbian-cross-ubuntu:10-${UBUNTU}
	docker push wpilib/aarch64-cross-ubuntu:bionic-${UBUNTU}
	docker push wpilib/opensdk-ubuntu:${UBUNTU}
	docker push wpilib/gazebo-ubuntu:${UBUNTU}

push-debian:
	docker push wpilib/debian-base:${DEBIAN}
	docker push wpilib/opensdk-debian:${DEBIAN}
