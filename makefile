./PHONY: build clean rebuild deno-test 

clean:
	pushd docker && make clean

build:
	pushd docker && make build

rebuild:
	pushd docker && make rebuild
