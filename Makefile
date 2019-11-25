.PHONY: all build run clean release

DOCKER_IMAGE := perk/www
DOCKER_CONTAINER := www
PORT := 7375

all: build

clean:
	sudo $(RM) -r public
	-@docker rm -vf $(DOCKER_CONTAINER) > /dev/null 2>&1

build:
	docker build --rm --force-rm --tag $(DOCKER_IMAGE) .

run: clean build
	docker run -it --rm \
		-v $(CURDIR):/usr/src/www \
		-p $(PORT):$(PORT)\
		--name $(DOCKER_CONTAINER) \
		$(DOCKER_IMAGE) \
		hugo server --port=$(PORT) --bind=0.0.0.0

release: build
	docker run --rm \
		-v $(CURDIR):/usr/src/www \
		--name $(DOCKER_CONTAINER) \
		$(DOCKER_IMAGE)
