# Set the default environment to "dev"
ENV ?= dev

# define the environment path
ENV_DIR := env/$(ENV)


#
# targets
.PHONY: all lint plan docs scan install test deploy

all: init lint docs scan test deploy

init:
	# in the specified `environment` directory.
	cd $(ENV_DIR) && terraform init

plan:
	# in the specified `environment` directory.
	cd $(ENV_DIR) && terraform apply

lint:
	# Run tflint to catch common errors and enforce best practices in your terraform code
	cd $(ENV_DIR) && tflint --config=../../.tflint.hcl

docs:
	# Generate documentation from your terraform code using terraform-docs
	terraform-docs $(ENV_DIR) --config=./.terraform-docs.yml

scan:
	# Scan your terraform code for security vulnerabilities using TFSec
	cd $(ENV_DIR) && tfsec .

install:
	$(shell ./scripts/install-hashicorp.sh terraform)
	$(shell ./scripts/install-hashicorp.sh terraform-ls)
	$(shell ./scripts/install-hashicorp.sh sentinel)
	$(shell ./scripts/install-hashicorp.sh vault)

test:
	# BATS
	cd ./scripts/tests/ && bats check.bats
	# Run tests for your terraform code using Terratest
	# go test ./test -v
	#
	# Run tests using Sentinel cli locally