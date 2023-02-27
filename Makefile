# Variables
PRODUCT_NAME := terraform
OS := $(shell uname | tr '[:upper:]' '[:lower:]')
VERSION := $(shell curl -s https://releases.hashicorp.com/$(PRODUCT_NAME)/index.json | jq -r ".versions[].version" | grep -E "^[0-9.]+$" | sort -V | tail -1)

.PHONY: all lint docs scan install test deploy

all: lint docs scan test deploy

lint:
	# Run tflint to catch common errors and enforce best practices in your terraform code
	tflint

docs:
	# Generate documentation from your terraform code using terraform-docs
	terraform-docs .

scan:
	# Scan your terraform code for security and compliance issues using Checkov
	checkov -d .

	# Scan your terraform code for security vulnerabilities using TFSec
	tfsec .

install:
	$(shell ./scripts/install-hashicorp.sh terraform)
	$(shell ./scripts/install-hashicorp.sh terraform-ls)
	$(shell ./scripts/install-hashicorp.sh sentinel)
	$(shell ./scripts/install-hashicorp.sh vault)

test:
	# Run tests for your terraform code using Terratest
	go test ./test -v

deploy:
	# Deploy your infrastructure-as-code using Feature-driven GitOps
	# TODO: insert your GitOps automation scripts here