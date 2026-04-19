OPENSDK_UBUNTU?=20.04
DEBIAN?=trixie

DS?=trixie

DOCKER_USER?=wpilib

.PHONY: usage update update/arm push build \
	$(patsubst %,build/%, arm-base base cross minimal-base minimal-cross opensdk)
	$(patsubst %,push/%, arm-base base cross minimal-base minimal-cross opensdk)
usage:
	@echo "Run make update, make build, and make push"

update:
	docker pull docker.io/debian:${DEBIAN}
	docker pull docker.io/ubuntu:${OPENSDK_UBUNTU}

update/arm:
	docker pull docker.io/debian:${DEBIAN}

build: build/base build/cross build/opensdk

build/arm-base:
	cd debian-base && \
		docker build -t ${DOCKER_USER}/debian-base:arm64-${DEBIAN} -f Dockerfile.${DEBIAN} .

build/base:
	cd debian-base && \
		docker build -t ${DOCKER_USER}/debian-base:${DEBIAN} -f Dockerfile.${DEBIAN} .

build/cross: build/base
	cd systemcore-cross-debian && \
	    docker build -t ${DOCKER_USER}/systemcore-cross-debian:${DEBIAN} -f Dockerfile.${DEBIAN} --build-arg DEBIAN=${DEBIAN} --build-arg TYPE=base .
	cd aarch64-cross-debian && \
	    docker build -t ${DOCKER_USER}/aarch64-cross-debian:${DEBIAN} -f Dockerfile.${DEBIAN} --build-arg DEBIAN=${DEBIAN} --build-arg TYPE=base .

build/minimal-base:
	cd debian-minimal-base && \
		docker build -t ${DOCKER_USER}/debian-minimal-base:${DEBIAN} -f Dockerfile.${DEBIAN} .

build/minimal-cross: build/minimal-base
	cd systemcore-cross-debian && \
	    docker build -t ${DOCKER_USER}/systemcore-cross-debian-minimal:${DEBIAN} -f Dockerfile.${DEBIAN} --build-arg DEBIAN=${DEBIAN} --build-arg TYPE=minimal-base .
	cd aarch64-cross-debian && \
	    docker build -t ${DOCKER_USER}/aarch64-cross-debian-minimal:${DEBIAN} -f Dockerfile.${DEBIAN} --build-arg DEBIAN=${DEBIAN} --build-arg TYPE=minimal-base .

build/opensdk:
	cd opensdk/ubuntu && \
		docker build -t ${DOCKER_USER}/opensdk-ubuntu:${OPENSDK_UBUNTU} --build-arg OPENSDK_UBUNTU=${OPENSDK_UBUNTU} .

push: $(patsubst %,push/%, base cross opensdk)

push/arm-base:
	docker push ${DOCKER_USER}/debian-base:arm64-${DEBIAN}

push/base:
	docker push ${DOCKER_USER}/debian-base:${DEBIAN}

push/cross: push/base
	docker push ${DOCKER_USER}/systemcore-cross-debian:${DEBIAN}
	docker push ${DOCKER_USER}/aarch64-cross-debian:${DEBIAN}

push/minimal-base:
	docker push ${DOCKER_USER}/debian-minimal-base:${DEBIAN}

push/minimal-cross: push/minimal-base
	docker push ${DOCKER_USER}/systemcore-cross-debian-minimal:${DEBIAN}
	docker push ${DOCKER_USER}/aarch64-cross-debian-minimal:${DEBIAN}

push/opensdk:
	docker push ${DOCKER_USER}/opensdk-ubuntu:${OPENSDK_UBUNTU}


.PHONY: save/minimal-cross
save/minimal-cross:
	docker save ${DOCKER_USER}/systemcore-cross-debian-minimal:${DEBIAN} | zstd > systemcore.tar.zst

include cross-debian-py/py.mk

update/ds:
	docker pull docker.io/debian:${DS}

build/ds:
	cd driverstation-base && \
		docker build -t ${DOCKER_USER}/driverstation-base:x64 -f Dockerfile.x64 .

push/ds:
	docker push ${DOCKER_USER}/driverstation-base:x64

update/armds:
	docker pull docker.io/arm64v8/debian:${DS}

build/armds:
	cd driverstation-base && \
		docker build -t ${DOCKER_USER}/driverstation-base:arm64 -f Dockerfile.arm64 .

push/armds:
	docker push ${DOCKER_USER}/driverstation-base:arm64
