# Makefile
#

all: clean build ## Build everything needed for the docs
		

clean:  	## Clean jekyll
		bundle exec jekyll clean

build:		## Build Jekyll
		bundle exec jekyll build

it_work: all run ## Just make it work

help:		# Prints help
		@echo "Make Targets:\n"
		@grep -E '^[a-zA-Z_-]+:.*?## .*$$' $(MAKEFILE_LIST) | sort | awk 'BEGIN {FS = ":.*?## "}; {printf "\033[36m%-30s\033[0m %s\n", $$1, $$2}'

run:   		## Run Site locally
		bundle exec jekyll server

.DEFAULT_GOAL := help
.PHONY: help

