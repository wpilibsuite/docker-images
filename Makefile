UBUNTU?=22.04
OPENSDK_UBUNTU?=20.04
DEBIAN?=bookworm

DOCKER_USER?=wpilib

.PHONY: usage update update/arm push build \
	$(patsubst %,build/%, arm-base base cross minimal-base minimal-cross opensdk)
	$(patsubst %,push/%, arm-base base cross minimal-base minimal-cross opensdk)
usage:
	@echo "Run make update, make build, and make push"

update:
	docker pull docker.io/ubuntu:${UBUNTU}
	docker pull docker.io/ubuntu:${OPENSDK_UBUNTU}

update/arm:
	docker pull docker.io/debian:${DEBIAN}

build: build/base build/cross build/opensdk

build/arm-base:
	cd debian-base && \
		docker build -t ${DOCKER_USER}/debian-base:arm64-${DEBIAN} -f Dockerfile.${DEBIAN} .

build/base:
	cd ubuntu-base && \
		docker build -t ${DOCKER_USER}/ubuntu-base:${UBUNTU} -f Dockerfile.${UBUNTU} .

build/cross: build/base
	cd roborio-cross-ubuntu && \
	    docker build -t ${DOCKER_USER}/roborio-cross-ubuntu:2025-${UBUNTU} -f Dockerfile.2025 --build-arg UBUNTU=${UBUNTU} --build-arg TYPE=base .
	cd systemcore-cross-ubuntu && \
	    docker build -t ${DOCKER_USER}/systemcore-cross-ubuntu:2027-${UBUNTU} -f Dockerfile.2027 --build-arg UBUNTU=${UBUNTU} --build-arg TYPE=base .
	cd raspbian-cross-ubuntu && \
	    docker build -t ${DOCKER_USER}/raspbian-cross-ubuntu:bookworm-${UBUNTU} -f Dockerfile.bookworm --build-arg UBUNTU=${UBUNTU} --build-arg TYPE=base .
	cd aarch64-cross-ubuntu && \
	    docker build -t ${DOCKER_USER}/aarch64-cross-ubuntu:bookworm-${UBUNTU} -f Dockerfile.bookworm --build-arg UBUNTU=${UBUNTU} --build-arg TYPE=base .

build/minimal-base:
	cd ubuntu-minimal-base && \
		docker build -t ${DOCKER_USER}/ubuntu-minimal-base:${UBUNTU} -f Dockerfile.${UBUNTU} .

build/minimal-cross: build/minimal-base
	cd roborio-cross-ubuntu && \
	    docker build -t ${DOCKER_USER}/roborio-cross-ubuntu-minimal:2025-${UBUNTU} -f Dockerfile.2025 --build-arg UBUNTU=${UBUNTU} --build-arg TYPE=minimal-base .
	cd systemcore-cross-ubuntu && \
	    docker build -t ${DOCKER_USER}/systemcore-cross-ubuntu-minimal:2027-${UBUNTU} -f Dockerfile.2027 --build-arg UBUNTU=${UBUNTU} --build-arg TYPE=minimal-base .
	cd raspbian-cross-ubuntu && \
	    docker build -t ${DOCKER_USER}/raspbian-cross-ubuntu-minimal:bookworm-${UBUNTU} -f Dockerfile.bookworm --build-arg UBUNTU=${UBUNTU} --build-arg TYPE=minimal-base .
	cd aarch64-cross-ubuntu && \
	    docker build -t ${DOCKER_USER}/aarch64-cross-ubuntu-minimal:bookworm-${UBUNTU} -f Dockerfile.bookworm --build-arg UBUNTU=${UBUNTU} --build-arg TYPE=minimal-base .

build/opensdk:
	cd opensdk/ubuntu && \
		docker build -t ${DOCKER_USER}/opensdk-ubuntu:${OPENSDK_UBUNTU} --build-arg OPENSDK_UBUNTU=${OPENSDK_UBUNTU} .

push: $(patsubst %,push/%, base cross opensdk)

push/arm-base:
	docker push ${DOCKER_USER}/debian-base:arm64-${DEBIAN}

push/base:
	docker push ${DOCKER_USER}/ubuntu-base:${UBUNTU}

push/cross: push/base
	docker push ${DOCKER_USER}/roborio-cross-ubuntu:2025-${UBUNTU}
	docker push ${DOCKER_USER}/systemcore-cross-ubuntu:2027-${UBUNTU}
	docker push ${DOCKER_USER}/raspbian-cross-ubuntu:bookworm-${UBUNTU}
	docker push ${DOCKER_USER}/aarch64-cross-ubuntu:bookworm-${UBUNTU}

push/minimal-base:
	docker push ${DOCKER_USER}/ubuntu-minimal-base:${UBUNTU}

push/minimal-cross: push/minimal-base
	docker push ${DOCKER_USER}/roborio-cross-ubuntu-minimal:2025-${UBUNTU}
	docker push ${DOCKER_USER}/systemcore-cross-ubuntu-minimal:2027-${UBUNTU}
	docker push ${DOCKER_USER}/raspbian-cross-ubuntu-minimal:bookworm-${UBUNTU}
	docker push ${DOCKER_USER}/aarch64-cross-ubuntu-minimal:bookworm-${UBUNTU}

push/opensdk:
	docker push ${DOCKER_USER}/opensdk-ubuntu:${OPENSDK_UBUNTU}


.PHONY: save/minimal-cross
save/minimal-cross:
	docker save ${DOCKER_USER}/roborio-cross-ubuntu-minimal:2025-${UBUNTU} | gzip > roborio.tar.gz
	docker save ${DOCKER_USER}/systemcore-cross-ubuntu-minimal:2027-${UBUNTU} | gzip > systemcore.tar.gz
	docker save ${DOCKER_USER}/raspbian-cross-ubuntu-minimal:bookworm-${UBUNTU} | gzip > raspbian.tar.gz
	docker save ${DOCKER_USER}/aarch64-cross-ubuntu-minimal:bookworm-${UBUNTU} | gzip > aarch64.tar.gz

include cross-ubuntu-py/py.mk
