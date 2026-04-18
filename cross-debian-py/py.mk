
DEBIAN?=trixie
YEAR?=2026
DOCKER_USER?=wpilib

TYPE_SYSTEMCORE=systemcore
VERSION_SYSTEMCORE=2027
TARGET_HOST_SYSTEMCORE=aarch64-bookworm-linux-gnu
AC_TARGET_HOST_SYSTEMCORE=aarch64-bookworm-linux-gnu


.PHONY: build/cross-python
build/cross-python: \
	build/cross-systemcore-py313 \
	build/cross-systemcore-py314


.PHONY: push/cross-python
push/cross-python: \
	push/cross-systemcore-py313 \
	push/cross-systemcore-py314

# systemcore manylinux tags for crossenv
SC_ML_VERSIONS := $(shell seq 35 -1 17)
SC_MANYLINUX_TAGS := $(foreach v,$(SC_ML_VERSIONS),--platform-tag=manylinux_2_$(v)_aarch64)

#
# Python 3.13
#

.PHONY: build/cross-systemcore-py313
build/cross-systemcore-py313:
	cd cross-debian-py && \
	docker build . \
		-t wpilib/$(TYPE_SYSTEMCORE)-cross-debian:$(YEAR)-$(DEBIAN)-py313 \
		--build-arg DEBIAN=$(DEBIAN) \
		--build-arg ARCH=$(TYPE_SYSTEMCORE) \
		--build-arg TARGET_HOST=$(TARGET_HOST_SYSTEMCORE) \
		--build-arg AC_TARGET_HOST=$(AC_TARGET_HOST_SYSTEMCORE) \
		--build-arg VERSION=$(VERSION_SYSTEMCORE) \
		--build-arg MACHINE_ARG="--machine=systemcore" \
		--build-arg EXTRA_CROSSENV_ARGS="--platform-tag=linux_systemcore $(SC_MANYLINUX_TAGS) --platform-tag=linux_aarch64" \
		-f Dockerfile.py313

.PHONY: push/cross-systemcore-py313
push/cross-systemcore-py313:
	docker push wpilib/$(TYPE_SYSTEMCORE)-cross-debian:$(YEAR)-$(DEBIAN)-py313


#
# Python 3.14
#

.PHONY: build/cross-systemcore-py314
build/cross-systemcore-py314:
	cd cross-debian-py && \
	docker build . \
		-t wpilib/$(TYPE_SYSTEMCORE)-cross-debian:$(YEAR)-$(DEBIAN)-py314 \
		--build-arg DEBIAN=$(DEBIAN) \
		--build-arg ARCH=$(TYPE_SYSTEMCORE) \
		--build-arg TARGET_HOST=$(TARGET_HOST_SYSTEMCORE) \
		--build-arg AC_TARGET_HOST=$(AC_TARGET_HOST_SYSTEMCORE) \
		--build-arg VERSION=$(VERSION_SYSTEMCORE) \
		--build-arg MACHINE_ARG="--machine=systemcore" \
		--build-arg EXTRA_CROSSENV_ARGS="--platform-tag=linux_systemcore $(SC_MANYLINUX_TAGS) --platform-tag=linux_aarch64" \
		-f Dockerfile.py314

.PHONY: push/cross-systemcore-py314
push/cross-systemcore-py314:
	docker push wpilib/$(TYPE_SYSTEMCORE)-cross-debian:$(YEAR)-$(DEBIAN)-py314