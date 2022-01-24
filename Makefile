DOCKER_TAG=taskserver

.PHONY: build

build:
	docker build --tag $(DOCKER_TAG) .
