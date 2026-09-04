GO ?= go
export CGO_ENABLED=0

.PHONY: build test vet image-fleetd image-agent validate-schema

build:
	mkdir -p bin
	if [ -d cmd/fleetd ]; then $(GO) build -o bin/fleetd ./cmd/fleetd; fi
	if [ -d cmd/fleet-agent ]; then $(GO) build -o bin/fleet-agent ./cmd/fleet-agent; fi
	$(GO) build ./...

test:
	$(GO) test ./...

vet:
	$(GO) vet ./...

image-fleetd:
	$(GO) build -o fleetd ./cmd/fleetd
	docker build -f Dockerfile.fleetd -t ghcr.io/fallrising/fleetd:dev .

image-agent:
	$(GO) build -o fleet-agent ./cmd/fleet-agent
	docker build -f Dockerfile.agent -t ghcr.io/fallrising/fleet-agent:dev .

validate-schema:
	$(GO) test ./internal/fleetfile ./internal/compose
