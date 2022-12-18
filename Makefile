all:
	go install ./...

getdev:
	go get -t ./...

test:
	go test -race -cover -covermode=atomic ./... 

docker-test:
	docker run --rm \
		-v $(PWD):/go/src/github.com/gonetlib/go-engine.io \
		-w /go/src/github.com/gonetlib/go-engine.io \
		-e GO111MODULE=on \
		golang:1.12 make test

bench:
	go test -bench . -benchmem ./...
