UBUNTU?=22.04
OPENSDK_UBUNTU?=20.04

DOCKER_USER?=wpilib

.PHONY: usage update push build \
	$(patsubst %,build/%, base cross opensdl)
	$(patsubst %,push/%, base cross opensdl)
usage:
	@echo "Run make update, make build, and make push"

update:
	docker pull docker.io/ubuntu:${UBUNTU}
	docker pull docker.io/ubuntu:${OPENSDK_UBUNTU}

build: build/base build/cross build/opensdk

build/base:
	cd ubuntu-base && \
		docker build -t ${DOCKER_USER}/ubuntu-base:${UBUNTU} -f Dockerfile.${UBUNTU} .
	cd gazebo-ubuntu && \
		docker build -t ${DOCKER_USER}/gazebo-ubuntu:${UBUNTU} --build-arg UBUNTU=${UBUNTU} .

build/cross: build/base
	cd roborio-cross-ubuntu && \
	    docker build -t ${DOCKER_USER}/roborio-cross-ubuntu:2024-${UBUNTU} -f Dockerfile.2024 --build-arg UBUNTU=${UBUNTU} .
	cd raspbian-cross-ubuntu && \
	    docker build -t ${DOCKER_USER}/raspbian-cross-ubuntu:bullseye-${UBUNTU} -f Dockerfile.bullseye --build-arg UBUNTU=${UBUNTU} .
	cd aarch64-cross-ubuntu && \
	    docker build -t ${DOCKER_USER}/aarch64-cross-ubuntu:bullseye-${UBUNTU} -f Dockerfile.bullseye --build-arg UBUNTU=${UBUNTU} .
	
build/opensdk:
	cd opensdk/ubuntu && \
		docker build -t ${DOCKER_USER}/opensdk-ubuntu:${OPENSDK_UBUNTU} --build-arg OPENSDK_UBUNTU=${OPENSDK_UBUNTU} .

push: $(patsubst %,push/%, base cross opensdk)

push/base:
	docker push ${DOCKER_USER}/ubuntu-base:${UBUNTU}
	docker push ${DOCKER_USER}/gazebo-ubuntu:${UBUNTU}

push/cross: push/base
	docker push ${DOCKER_USER}/roborio-cross-ubuntu:2024-${UBUNTU}
	docker push ${DOCKER_USER}/raspbian-cross-ubuntu:bullseye-${UBUNTU}
	docker push ${DOCKER_USER}/aarch64-cross-ubuntu:bullseye-${UBUNTU}

push/opensdk:
	docker push ${DOCKER_USER}/opensdk-ubuntu:${OPENSDK_UBUNTU}
