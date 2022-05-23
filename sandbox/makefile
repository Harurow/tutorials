VNO_BASE_HASH = $(shell docker image ls -q "harurow/vno:current")

.PHONY: build up down clean

build:
ifeq ($(VNO_BASE_HASH),)
	pushd ../docker && make build
endif

rebuild:
	docker compose down --rmi all --volumes --remove-orphans
	pushd ../docker && make rebuild
	
up:
	make build
	docker compose up

run:
	make build
	docker compose up -d

down:
	docker compose down

clean:
	docker compose down --rmi all --volumes --remove-orphans
	pushd ../docker && make clean

