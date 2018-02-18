# Makefile for TinyFish Project
#

.PHONY: build
build: 		## Build a container to serve GitHub Pages locally
		docker build -f ./Python/Dockerfile . --tag=tinyfish:latest

.PHONY: docs_build
docs_build:     ## Build a container to serve GitHub Pages locally
		docker build -f ./GitHubPages/Dockerfile . --tag=ghpages:base

.PHONY: docs_serve
docs_serve:     ## Serve the /docs GitHub Pages locally
		docker run -v $(CURDIR):/app/ -p 4000:4000 ghpages:base serve --host 0.0.0.0

.PHONY: help
help:		# Prints help
		@echo "Make Targets:\n"
		@grep -E '^[a-zA-Z_-]+:.*?## .*$$' $(MAKEFILE_LIST) | sort | awk 'BEGIN {FS = ":.*?## "}; {printf "\033[36m%-30s\033[0m %s\n", $$1, $$2}'

.PHONY: proxy_build
proxy_build:    ## Build the tinfish nginx proxy container
		docker build -f ./Nginx/Dockerfile ./Nginx/ --tag=tinyfish:proxy

.PHONY: proxy_run
proxy_run:	## Run the tinfish nginx proxy container
		docker run -p 80:80 tinyfish:proxy

.PHONY: run
run:   		## Run the TinyFish application.  Make sure your datadog api key is in datadog.env
		docker-compose up

.DEFAULT_GOAL := help
