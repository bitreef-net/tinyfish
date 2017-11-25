# Makefile
#
#
all: init_venv install_deps ## Build everything needed to run the app
		PYTHONPATH=venv ; . venv/bin/activate

docs_build:     ## Build a container to serve GitHub Pages locally
		docker build -f Dockerfile.ghpages . --tag=ghpages:base

docs_serve:     ## Serve the /docs GitHub Pages locally
		docker run -v $(CURDIR):/app/ -p 4000:4000 ghpages:base serve --host 0.0.0.0

clean_venv:  	## Delete the virtual environment
		rm -rf venv

freeze:		## Version pin all current installed dependencies
		. venv/bin/activate && venv/bin/pip freeze > requirements.txt

init_venv: 	## Create a python 3 virtual environment
		virtualenv -p python3 venv

install_deps:	## Install all dependencies in the venv
		PYTHONPATH=venv ; . venv/bin/activate && venv/bin/pip install -U -r requirements.txt

it_work: clean_venv all run ## Just make it work

help:		# Prints help
		@echo "Make Targets:\n"
		@grep -E '^[a-zA-Z_-]+:.*?## .*$$' $(MAKEFILE_LIST) | sort | awk 'BEGIN {FS = ":.*?## "}; {printf "\033[36m%-30s\033[0m %s\n", $$1, $$2}'

run:   		## Run the application in the virtual environemnt
		PYTHONPATH=venv ; . venv/bin/activate ; FLASK_APP=tinyfish.py flask run

.DEFAULT_GOAL := help
.PHONY: help

