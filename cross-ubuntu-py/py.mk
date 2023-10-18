
UBUNTU?=22.04
DOCKER_USER?=wpilib

TYPE_RASPBIAN=raspbian
VERSION_RASPBIAN=bullseye
TARGET_HOST_RASPBIAN=armv6-bullseye-linux-gnueabihf
AC_TARGET_HOST_RASPBIAN=armv7l-bullseye-linux-gnueabihf

TYPE_AARCH64=aarch64
VERSION_AARCH64=bullseye
TARGET_HOST_AARCH64=aarch64-bullseye-linux-gnu
AC_TARGET_HOST_AARCH64=aarch64-bullseye-linux-gnu

TYPE_ROBORIO=roborio
VERSION_ROBORIO=2024
TARGET_HOST_ROBORIO=arm-frc2024-linux-gnueabi
AC_TARGET_HOST_ROBORIO=armv7l-frc2024-linux-gnueabi


.PHONY: build/cross-python
build/cross-python: build/cross-raspbian-py38 build/cross-aarch64-py38 build/cross-raspbian-py39 build/cross-aarch64-py39 build/cross-raspbian-py310 build/cross-aarch64-py310 build/cross-raspbian-py311 build/cross-aarch64-py311 build/cross-roborio-py312 build/cross-raspbian-py312 build/cross-aarch64-py312

.PHONY: push/cross-python
push/cross-python: push/cross-raspbian-py38 push/cross-aarch64-py38 push/cross-raspbian-py39 push/cross-aarch64-py39 push/cross-raspbian-py310 push/cross-aarch64-py310 push/cross-raspbian-py311 push/cross-aarch64-py311 push/cross-roborio-py312 push/cross-raspbian-py312 push/cross-aarch64-py312


#
# Python 3.8
#

.PHONY: build/cross-raspbian-py38
build/cross-raspbian-py38:
	cd cross-ubuntu-py && \
	docker build . \
		-t wpilib/$(TYPE_RASPBIAN)-cross-ubuntu:$(VERSION_RASPBIAN)-$(UBUNTU)-py38 \
		--build-arg ARCH=$(TYPE_RASPBIAN) \
		--build-arg TARGET_HOST=$(TARGET_HOST_RASPBIAN) \
		--build-arg AC_TARGET_HOST=$(AC_TARGET_HOST_RASPBIAN) \
		--build-arg VERSION=$(VERSION_RASPBIAN) \
		-f Dockerfile.py38

.PHONY: push/cross-raspbian-py38
push/cross-raspbian-py38:
	docker push wpilib/$(TYPE_RASPBIAN)-cross-ubuntu:$(VERSION_RASPBIAN)-$(UBUNTU)-py38


.PHONY: build/cross-aarch64-py38
build/cross-aarch64-py38:
	cd cross-ubuntu-py && \
	docker build . \
		-t wpilib/$(TYPE_AARCH64)-cross-ubuntu:$(VERSION_AARCH64)-$(UBUNTU)-py38 \
		--build-arg ARCH=$(TYPE_AARCH64) \
		--build-arg TARGET_HOST=$(TARGET_HOST_AARCH64) \
		--build-arg AC_TARGET_HOST=$(AC_TARGET_HOST_AARCH64) \
		--build-arg VERSION=$(VERSION_AARCH64) \
		-f Dockerfile.py38

.PHONY: push/cross-aarch64-py38
push/cross-aarch64-py38:
	docker push wpilib/$(TYPE_AARCH64)-cross-ubuntu:$(VERSION_AARCH64)-$(UBUNTU)-py38


#
# Python 3.9
#

.PHONY: build/cross-raspbian-py39
build/cross-raspbian-py39:
	cd cross-ubuntu-py && \
	docker build . \
		-t wpilib/$(TYPE_RASPBIAN)-cross-ubuntu:$(VERSION_RASPBIAN)-$(UBUNTU)-py39 \
		--build-arg ARCH=$(TYPE_RASPBIAN) \
		--build-arg TARGET_HOST=$(TARGET_HOST_RASPBIAN) \
		--build-arg AC_TARGET_HOST=$(AC_TARGET_HOST_RASPBIAN) \
		--build-arg VERSION=$(VERSION_RASPBIAN) \
		-f Dockerfile.py39

.PHONY: push/cross-raspbian-py39
push/cross-raspbian-py39:
	docker push wpilib/$(TYPE_RASPBIAN)-cross-ubuntu:$(VERSION_RASPBIAN)-$(UBUNTU)-py39


.PHONY: build/cross-aarch64-py39
build/cross-aarch64-py39:
	cd cross-ubuntu-py && \
	docker build . \
		-t wpilib/$(TYPE_AARCH64)-cross-ubuntu:$(VERSION_AARCH64)-$(UBUNTU)-py39 \
		--build-arg ARCH=$(TYPE_AARCH64) \
		--build-arg TARGET_HOST=$(TARGET_HOST_AARCH64) \
		--build-arg AC_TARGET_HOST=$(AC_TARGET_HOST_AARCH64) \
		--build-arg VERSION=$(VERSION_AARCH64) \
		-f Dockerfile.py39

.PHONY: push/cross-aarch64-py39
push/cross-aarch64-py39:
	docker push wpilib/$(TYPE_AARCH64)-cross-ubuntu:$(VERSION_AARCH64)-$(UBUNTU)-py39


#
# Python 3.10
#

.PHONY: build/cross-raspbian-py310
build/cross-raspbian-py310:
	cd cross-ubuntu-py && \
	docker build . \
		-t wpilib/$(TYPE_RASPBIAN)-cross-ubuntu:$(VERSION_RASPBIAN)-$(UBUNTU)-py310 \
		--build-arg ARCH=$(TYPE_RASPBIAN) \
		--build-arg TARGET_HOST=$(TARGET_HOST_RASPBIAN) \
		--build-arg AC_TARGET_HOST=$(AC_TARGET_HOST_RASPBIAN) \
		--build-arg VERSION=$(VERSION_RASPBIAN) \
		-f Dockerfile.py310

.PHONY: push/cross-raspbian-py310
push/cross-raspbian-py310:
	docker push wpilib/$(TYPE_RASPBIAN)-cross-ubuntu:$(VERSION_RASPBIAN)-$(UBUNTU)-py310


.PHONY: build/cross-aarch64-py310
build/cross-aarch64-py310:
	cd cross-ubuntu-py && \
	docker build . \
		-t wpilib/$(TYPE_AARCH64)-cross-ubuntu:$(VERSION_AARCH64)-$(UBUNTU)-py310 \
		--build-arg ARCH=$(TYPE_AARCH64) \
		--build-arg TARGET_HOST=$(TARGET_HOST_AARCH64) \
		--build-arg AC_TARGET_HOST=$(AC_TARGET_HOST_AARCH64) \
		--build-arg VERSION=$(VERSION_AARCH64) \
		-f Dockerfile.py310

.PHONY: push/cross-aarch64-py310
push/cross-aarch64-py310:
	docker push wpilib/$(TYPE_AARCH64)-cross-ubuntu:$(VERSION_AARCH64)-$(UBUNTU)-py310


#
# Python 3.11
#

.PHONY: build/cross-raspbian-py311
build/cross-raspbian-py311:
	cd cross-ubuntu-py && \
	docker build . \
		-t wpilib/$(TYPE_RASPBIAN)-cross-ubuntu:$(VERSION_RASPBIAN)-$(UBUNTU)-py311 \
		--build-arg ARCH=$(TYPE_RASPBIAN) \
		--build-arg TARGET_HOST=$(TARGET_HOST_RASPBIAN) \
		--build-arg AC_TARGET_HOST=$(AC_TARGET_HOST_RASPBIAN) \
		--build-arg VERSION=$(VERSION_RASPBIAN) \
		-f Dockerfile.py311

.PHONY: push/cross-raspbian-py311
push/cross-raspbian-py311:
	docker push wpilib/$(TYPE_RASPBIAN)-cross-ubuntu:$(VERSION_RASPBIAN)-$(UBUNTU)-py311


.PHONY: build/cross-aarch64-py311
build/cross-aarch64-py311:
	cd cross-ubuntu-py && \
	docker build . \
		-t wpilib/$(TYPE_AARCH64)-cross-ubuntu:$(VERSION_AARCH64)-$(UBUNTU)-py311 \
		--build-arg ARCH=$(TYPE_AARCH64) \
		--build-arg TARGET_HOST=$(TARGET_HOST_AARCH64) \
		--build-arg AC_TARGET_HOST=$(AC_TARGET_HOST_AARCH64) \
		--build-arg VERSION=$(VERSION_AARCH64) \
		-f Dockerfile.py311

.PHONY: push/cross-aarch64-py311
push/cross-aarch64-py311:
	docker push wpilib/$(TYPE_AARCH64)-cross-ubuntu:$(VERSION_AARCH64)-$(UBUNTU)-py311



#
# Python 3.12
#

.PHONY: build/cross-raspbian-py312
build/cross-raspbian-py312:
	cd cross-ubuntu-py && \
	docker build . \
		-t wpilib/$(TYPE_RASPBIAN)-cross-ubuntu:$(VERSION_RASPBIAN)-$(UBUNTU)-py312 \
		--build-arg ARCH=$(TYPE_RASPBIAN) \
		--build-arg TARGET_HOST=$(TARGET_HOST_RASPBIAN) \
		--build-arg AC_TARGET_HOST=$(AC_TARGET_HOST_RASPBIAN) \
		--build-arg VERSION=$(VERSION_RASPBIAN) \
		-f Dockerfile.py312

.PHONY: push/cross-raspbian-py312
push/cross-raspbian-py312:
	docker push wpilib/$(TYPE_RASPBIAN)-cross-ubuntu:$(VERSION_RASPBIAN)-$(UBUNTU)-py312


.PHONY: build/cross-roborio-py312
build/cross-roborio-py312:
	cd cross-ubuntu-py && \
	docker build . \
		-t wpilib/$(TYPE_ROBORIO)-cross-ubuntu:$(VERSION_ROBORIO)-$(UBUNTU)-py312 \
		--build-arg ARCH=$(TYPE_ROBORIO) \
		--build-arg TARGET_HOST=$(TARGET_HOST_ROBORIO) \
		--build-arg AC_TARGET_HOST=$(AC_TARGET_HOST_ROBORIO) \
		--build-arg VERSION=$(VERSION_ROBORIO) \
		--build-arg MACHINE_ARG="--machine=roborio" \
		-f Dockerfile.py312

.PHONY: push/cross-roborio-py312
push/cross-roborio-py312:
	docker push wpilib/$(TYPE_ROBORIO)-cross-ubuntu:$(VERSION_ROBORIO)-$(UBUNTU)-py312



.PHONY: build/cross-aarch64-py312
build/cross-aarch64-py312:
	cd cross-ubuntu-py && \
	docker build . \
		-t wpilib/$(TYPE_AARCH64)-cross-ubuntu:$(VERSION_AARCH64)-$(UBUNTU)-py312 \
		--build-arg ARCH=$(TYPE_AARCH64) \
		--build-arg TARGET_HOST=$(TARGET_HOST_AARCH64) \
		--build-arg AC_TARGET_HOST=$(AC_TARGET_HOST_AARCH64) \
		--build-arg VERSION=$(VERSION_AARCH64) \
		-f Dockerfile.py312

.PHONY: push/cross-aarch64-py312
push/cross-aarch64-py312:
	docker push wpilib/$(TYPE_AARCH64)-cross-ubuntu:$(VERSION_AARCH64)-$(UBUNTU)-py312
