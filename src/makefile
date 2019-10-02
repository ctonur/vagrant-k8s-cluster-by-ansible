ifndef TAG
$(error The TAG variable is missing.)
endif

ifndef PROJE
$(error The PROJE variable is missing.)
endif

ifndef APP
$(error The APP variable is missing.)
endif


IMAGE := $(PROJE)/$(APP)
 
 
build:
	$(info Make: Building "$(TAG)" tagged images.)
	@docker build -t $(IMAGE):$(TAG) -f Dockerfile .
	@make -s tag
	@make -s clean
 
tag:
	$(info Make: Tagging image with "$(TAG)".)
	@docker tag $(IMAGE):latest $(IMAGE):$(TAG)
 
 
push:
	$(info Make: Pushing "$(TAG)" tagged image.)
	@docker push $(IMAGE):$(TAG)
 
clean:
	@docker system prune --volumes --force
 
login:
	$(info Make: Login to Docker Hub.)
	@docker login -u $(DOCKER_USER) -p $(DOCKER_PASS)
