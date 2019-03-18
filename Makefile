OWNER ?= chenrui
IMAGE ?= atlantis-terragrunt
QNAME ?= $(OWNER)/$(IMAGE)

GIT_TAG=$(QNAME):$(TRAVIS_COMMIT)
VERSION ?= 0.2
BUILD_TAG ?= $(QNAME):$(VERSION)
LATEST_TAG ?= $(QNAME):latest

lint:
	docker run -it --rm -v "$(PWD)/Dockerfile:/Dockerfile:ro" redcoolbeans/dockerlint

build: lint
	docker build -t $(GIT_TAG) .

tag: build
	docker tag $(GIT_TAG) $(BUILD_TAG)
	docker tag $(GIT_TAG) $(LATEST_TAG)

login:
	@docker login -u "$(DOCKER_USERNAME)" -p "$(DOCKER_PASS)"

publish: login tag
	docker push $(GIT_TAG)
	docker push $(BUILD_TAG)
	docker push $(LATEST_TAG)
