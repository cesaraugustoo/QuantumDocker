.PHONY: base-notebook quantum-lite quantum-full quantum-full-and-qsharp

# tag Docker builds with branch name (and map master->latest)
branch:=$(subst master,latest,$(shell git rev-parse --abbrev-ref HEAD))

all: base-notebook quantum-lite quantum-full quantum-full-and-qsharp

base-notebook: base-notebook/Dockerfile
	docker build --build-arg DOCKER_TAG=$(branch) -t docker.io/cesaraugustoo/base-notebook:$(branch) base-notebook

quantum-lite: base-notebook/Dockerfile quantum-lite/Dockerfile
	docker build --build-arg DOCKER_TAG=$(branch) -t docker.io/cesaraugustoo/quantum-lite:$(branch) quantum-lite

quantum-full: base-notebook/Dockerfile quantum-lite/Dockerfile quantum-full/Dockerfile
	docker build -t docker.io/cesaraugustoo/quantum-full quantum-full
	
quantum-network: base-notebook/Dockerfile quantum-lite/Dockerfile quantum-full/Dockerfile
    docker build -t docker.io/cesaraugustoo/quantum-network quantum-network

quantum-full-and-qsharp: base-notebook/Dockerfile quantum-lite/Dockerfile quantum-full/Dockerfile quantum-full-and-qsharp/Dockerfile
	docker build -t docker.io/cesaraugustoo/quantum-full-and-qsharp quantum-full-and-qsharp


