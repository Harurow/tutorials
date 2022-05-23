PREF	= harurow
IMAGES	= alpine \
		  alpine-deno \
		  node \
		  vue \
		  deno \
		  vno

define _build
	@echo build "$(PREF)/$(strip $1):current"
	$(if $(shell docker image ls -q "$(PREF)/$(strip $1):current"),
		@echo alredy exists.,
		docker build ./$(strip $1) -t "$(PREF)/$(strip $1):current"
	)
endef

define _clean
	@echo clean "$(PREF)/$(strip $1):current"
	$(if $(shell docker image ls -q "$(PREF)/$(strip $1):current"),
		-docker rmi "$(PREF)/$(strip $1):current"
	)
endef

./PHONY: build clean rebuild rerun

build:
	@echo build docker images
	$(foreach i, $(IMAGES), $(call _build, $(i)))

clean:
	@echo clean docker images
	$(foreach i, $(IMAGES), $(call _clean, $(i)))

rebuild:
	make clean
	make build

rerun:
	-docker rmi "harurow/deno:current"
	docker build ./deno -t "harurow/deno:current"
	docker run -it "harurow/deno:current" "bin/bash"

