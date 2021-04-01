UBUNTU=18.04
TARGETS=ubuntu-base roborio-cross-ubuntu raspbian-cross-ubuntu aarch64-cross-ubuntu gazebo-ubuntu

.PHONY: usage build update push ${TARGETS}

usage:
	@echo "Run make update, make build, and make push"

update:
	docker pull ubuntu:${UBUNTU}
build: ${TARGETS}

ubuntu-base:
	cd $@ && docker build -t wpilib/$@:${UBUNTU} .

roborio-cross-ubuntu: ubuntu-base
	cd $@ && docker build -t wpilib/$@:2020-${UBUNTU} -f Dockerfile.2020 .
	cd $@ && docker build -t wpilib/$@:2021-${UBUNTU} -f Dockerfile.2021 .

raspbian-cross-ubuntu: ubuntu-base
	cd $@ && docker build -t wpilib/$@:2020-${UBUNTU} -f Dockerfile.9 .
	cd $@ && docker build -t wpilib/$@:2021-${UBUNTU} -f Dockerfile.10 .

aarch64-cross-ubuntu: ubuntu-base
	cd $@ && docker build -t wpilib/$@:bionic-${UBUNTU} -f Dockerfile.bionic .

gazebo-ubuntu:
	cd $@ && docker build -t wpilib/$@:${UBUNTU} .

push:
	docker push wpilib/ubuntu-base:${UBUNTU}
	docker push wpilib/roborio-cross-ubuntu:2020-${UBUNTU}
	docker push wpilib/roborio-cross-ubuntu:2021-${UBUNTU}
	docker push wpilib/raspbian-cross-ubuntu:9-${UBUNTU}
	docker push wpilib/raspbian-cross-ubuntu:10-${UBUNTU}
	docker push wpilib/aarch64-cross-ubuntu:bionic-${UBUNTU}
	docker push wpilib/gazebo-ubuntu:${UBUNTU}
