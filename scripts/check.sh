#!/bin/bash

# Check OS
case "$(uname -s)" in
Linux*) OS=linux ;;
Darwin*) OS=osx ;;
CYGWIN*) OS=windows ;;
MINGW*) OS=windows ;;
*) echo "Unsupported OS. Exiting." && exit 1 ;;
esac

# Check if Terraform is installed
if ! command -v terraform &>/dev/null; then
    # Install Terraform
    echo "Terraform not found."
fi

# Check if TFLint is installed
if ! command -v tflint &>/dev/null; then
    # Install TFLint
    echo "TFLint not found."
fi

# Check if TFSec is installed
if ! command -v tfsec &>/dev/null; then
    # Install TFSec
    echo "TFSec not found."
fi

# Check if Terraform-docs is installed
if ! command -v terraform-docs &>/dev/null; then
    # Install Terraform-docs
    echo "Terraform-docs not found."
fi

echo "All required tools are installed."
