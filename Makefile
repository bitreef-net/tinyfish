# Makefile for TinyFish Project
#

.PHONY: build
build: 		## Build a container to serve GitHub Pages locally
		docker build -f ./Python/Dockerfile . --tag=tinyfish:latest

.PHONY: docs_build
docs_build:     ## Build a container to serve GitHub Pages locally
		docker build -f ./GitHubPages/Dockerfile . --tag=ghpages:base

.PHONY: doc_serve
docs_serve:     ## Serve the /docs GitHub Pages locally
		docker run -v $(CURDIR):/app/ -p 4000:4000 ghpages:base serve --host 0.0.0.0

.PHONY: it_work
it_work: build run ## Just get the project up and running

.PHONY: help
help:		# Prints help
		@echo "Make Targets:\n"
		@grep -E '^[a-zA-Z_-]+:.*?## .*$$' $(MAKEFILE_LIST) | sort | awk 'BEGIN {FS = ":.*?## "}; {printf "\033[36m%-30s\033[0m %s\n", $$1, $$2}'

.PHONY: run
run:   		## Run the TinyFish application in a container
		docker run -p 5000:5000 tinyfish:latest

.DEFAULT_GOAL := help
