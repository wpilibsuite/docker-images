
UBUNTU?=22.04
YEAR?=2025
DOCKER_USER?=wpilib

TYPE_RASPBIAN=raspbian
VERSION_RASPBIAN=bookworm
TARGET_HOST_RASPBIAN=armv6-bookworm-linux-gnueabihf
AC_TARGET_HOST_RASPBIAN=armv7l-bookworm-linux-gnueabihf

TYPE_ROBORIO=roborio
VERSION_ROBORIO=2025
TARGET_HOST_ROBORIO=arm-frc2025-linux-gnueabi
AC_TARGET_HOST_ROBORIO=armv7l-frc2025-linux-gnueabi

TYPE_SYSTEMCORE=systemcore
VERSION_SYSTEMCORE=2027
TARGET_HOST_SYSTEMCORE=aarch64-bookworm-linux-gnu
AC_TARGET_HOST_SYSTEMCORE=aarch64-bookworm-linux-gnu


.PHONY: build/cross-python
build/cross-python: build/cross-raspbian-py311 build/cross-raspbian-py312 build/cross-roborio-py313 build/cross-systemcore-py313 build/cross-raspbian-py313


.PHONY: push/cross-python
push/cross-python: push/cross-raspbian-py311 push/cross-raspbian-py312 push/cross-roborio-py313 push/cross-systemcore-py313 push/cross-raspbian-py313


# raspbian manylinux tags for crossenv
RPI_ML_VERSIONS := $(shell seq 36 -1 17)
RPI_MANYLINUX_TAGS := $(foreach v,$(RPI_ML_VERSIONS),--platform-tag=manylinux_2_$(v)_armv7l)

# systemcore manylinux tags for crossenv
SC_ML_VERSIONS := $(shell seq 35 -1 17)
SC_MANYLINUX_TAGS := $(foreach v,$(SC_ML_VERSIONS),--platform-tag=manylinux_2_$(v)_aarch64)


#
# Python 3.11
#

.PHONY: build/cross-raspbian-py311
build/cross-raspbian-py311:
	cd cross-ubuntu-py && \
	docker build . \
		-t wpilib/$(TYPE_RASPBIAN)-cross-ubuntu:$(YEAR)-$(VERSION_RASPBIAN)-$(UBUNTU)-py311 \
		--build-arg ARCH=$(TYPE_RASPBIAN) \
		--build-arg TARGET_HOST=$(TARGET_HOST_RASPBIAN) \
		--build-arg AC_TARGET_HOST=$(AC_TARGET_HOST_RASPBIAN) \
		--build-arg VERSION=$(VERSION_RASPBIAN) \
		--build-arg EXTRA_CROSSENV_ARGS="$(RPI_MANYLINUX_TAGS) --platform-tag=linux_armv7l" \
		-f Dockerfile.py311

	cd cross-ubuntu-py && \
	docker build . \
		-t wpilib/$(TYPE_RASPBIAN)-cross-ubuntu:2027-$(VERSION_RASPBIAN)-$(UBUNTU)-py311 \
		--build-arg IMAGE=wpilib/$(TYPE_RASPBIAN)-cross-ubuntu:$(YEAR)-$(VERSION_RASPBIAN)-$(UBUNTU)-py311 \
		-f Dockerfile.raspbian-2027

.PHONY: push/cross-raspbian-py311
push/cross-raspbian-py311:
	docker push wpilib/$(TYPE_RASPBIAN)-cross-ubuntu:$(YEAR)-$(VERSION_RASPBIAN)-$(UBUNTU)-py311

	docker push wpilib/$(TYPE_RASPBIAN)-cross-ubuntu:2027-$(VERSION_RASPBIAN)-$(UBUNTU)-py311


#
# Python 3.12
#

.PHONY: build/cross-raspbian-py312
build/cross-raspbian-py312:
	cd cross-ubuntu-py && \
	docker build . \
		-t wpilib/$(TYPE_RASPBIAN)-cross-ubuntu:$(YEAR)-$(VERSION_RASPBIAN)-$(UBUNTU)-py312 \
		--build-arg ARCH=$(TYPE_RASPBIAN) \
		--build-arg TARGET_HOST=$(TARGET_HOST_RASPBIAN) \
		--build-arg AC_TARGET_HOST=$(AC_TARGET_HOST_RASPBIAN) \
		--build-arg VERSION=$(VERSION_RASPBIAN) \
		--build-arg EXTRA_CROSSENV_ARGS="$(RPI_MANYLINUX_TAGS) --platform-tag=linux_armv7l" \
		-f Dockerfile.py312

	cd cross-ubuntu-py && \
	docker build . \
		-t wpilib/$(TYPE_RASPBIAN)-cross-ubuntu:2027-$(VERSION_RASPBIAN)-$(UBUNTU)-py312 \
		--build-arg IMAGE=wpilib/$(TYPE_RASPBIAN)-cross-ubuntu:$(YEAR)-$(VERSION_RASPBIAN)-$(UBUNTU)-py312 \
		-f Dockerfile.raspbian-2027

.PHONY: push/cross-raspbian-py312
push/cross-raspbian-py312:
	docker push wpilib/$(TYPE_RASPBIAN)-cross-ubuntu:$(YEAR)-$(VERSION_RASPBIAN)-$(UBUNTU)-py312

	docker push wpilib/$(TYPE_RASPBIAN)-cross-ubuntu:2027-$(VERSION_RASPBIAN)-$(UBUNTU)-py312


#
# Python 3.13
#

.PHONY: build/cross-raspbian-py313
build/cross-raspbian-py313:
	cd cross-ubuntu-py && \
	docker build . \
		-t wpilib/$(TYPE_RASPBIAN)-cross-ubuntu:$(YEAR)-$(VERSION_RASPBIAN)-$(UBUNTU)-py313 \
		--build-arg ARCH=$(TYPE_RASPBIAN) \
		--build-arg TARGET_HOST=$(TARGET_HOST_RASPBIAN) \
		--build-arg AC_TARGET_HOST=$(AC_TARGET_HOST_RASPBIAN) \
		--build-arg VERSION=$(VERSION_RASPBIAN) \
		--build-arg EXTRA_CROSS_CONFIGURE_ARGS="ac_cv_libatomic_needed=yes" \
		--build-arg EXTRA_CROSSENV_ARGS="$(RPI_MANYLINUX_TAGS) --platform-tag=linux_armv7l" \
		-f Dockerfile.py313

	cd cross-ubuntu-py && \
	docker build . \
		-t wpilib/$(TYPE_RASPBIAN)-cross-ubuntu:2027-$(VERSION_RASPBIAN)-$(UBUNTU)-py313 \
		--build-arg IMAGE=wpilib/$(TYPE_RASPBIAN)-cross-ubuntu:$(YEAR)-$(VERSION_RASPBIAN)-$(UBUNTU)-py313 \
		-f Dockerfile.raspbian-2027

.PHONY: push/cross-raspbian-py313
push/cross-raspbian-py313:
	docker push wpilib/$(TYPE_RASPBIAN)-cross-ubuntu:$(YEAR)-$(VERSION_RASPBIAN)-$(UBUNTU)-py313

	docker push wpilib/$(TYPE_RASPBIAN)-cross-ubuntu:2027-$(VERSION_RASPBIAN)-$(UBUNTU)-py313


.PHONY: build/cross-roborio-py313
build/cross-roborio-py313:
	cd cross-ubuntu-py && \
	docker build . \
		-t wpilib/$(TYPE_ROBORIO)-cross-ubuntu:$(YEAR)-$(UBUNTU)-py313 \
		--build-arg ARCH=$(TYPE_ROBORIO) \
		--build-arg TARGET_HOST=$(TARGET_HOST_ROBORIO) \
		--build-arg AC_TARGET_HOST=$(AC_TARGET_HOST_ROBORIO) \
		--build-arg VERSION=$(VERSION_ROBORIO) \
		--build-arg MACHINE_ARG="--machine=roborio" \
		--build-arg EXTRA_CROSSENV_ARGS="--platform-tag=linux_roborio" \
		-f Dockerfile.py313

.PHONY: push/cross-roborio-py313
push/cross-roborio-py313:
	docker push wpilib/$(TYPE_ROBORIO)-cross-ubuntu:$(YEAR)-$(UBUNTU)-py313



.PHONY: build/cross-systemcore-py313
build/cross-systemcore-py313:
	cd cross-ubuntu-py && \
	docker build . \
		-t wpilib/$(TYPE_SYSTEMCORE)-cross-ubuntu:$(YEAR)-$(UBUNTU)-py313 \
		--build-arg ARCH=$(TYPE_SYSTEMCORE) \
		--build-arg TARGET_HOST=$(TARGET_HOST_SYSTEMCORE) \
		--build-arg AC_TARGET_HOST=$(AC_TARGET_HOST_SYSTEMCORE) \
		--build-arg VERSION=$(VERSION_SYSTEMCORE) \
		--build-arg MACHINE_ARG="--machine=systemcore" \
		--build-arg EXTRA_CROSSENV_ARGS="--platform-tag=linux_systemcore $(SC_MANYLINUX_TAGS) --platform-tag=linux_aarch64" \
		-f Dockerfile.py313

.PHONY: push/cross-systemcore-py313
push/cross-systemcore-py313:
	docker push wpilib/$(TYPE_SYSTEMCORE)-cross-ubuntu:$(YEAR)-$(UBUNTU)-py313