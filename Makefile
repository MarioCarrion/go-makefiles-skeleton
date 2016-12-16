NAMESPACE=mariocarrion/go-makefiles-skeleton

PROGRAMS=hello something

.PHONY: clean

default: build

$(PROGRAMS):
	docker run --tty ${NAMESPACE}:build /bin/true && \
		docker cp `docker ps -q -n=1`:/$@ . && \
		docker rm `docker ps -q -n=1`

builddocker:
	docker build --tag ${NAMESPACE}:build --file ./Dockerfile.build .

build: builddocker $(PROGRAMS)
	touch .env && \
		docker run --tty ${NAMESPACE}:build /bin/true && \
		docker rm `docker ps -q -n=1` && \
		docker build --rm --tag ${NAMESPACE}:latest --file ./Dockerfile.static .

gobuild:
	for program in $(PROGRAMS) ; do \
		CGO_ENABLED=0 GOOS=linux go build --ldflags="-s" -a -installsuffix cgo \
			-o $${program} ./go/src/github.com/MarioCarrion/go-makefiles-skeleton/cmd/$${program}; \
	done
