#!/bin/bash

# Check OS
case "$(uname -s)" in
   Linux*)  OS=linux;;
   Darwin*) OS=osx;;
   CYGWIN*) OS=windows;;
   MINGW*)  OS=windows;;
   *)       echo "Unsupported OS. Exiting." && exit 1;;
esac

# Check if Terraform is installed
if ! command -v terraform &> /dev/null
then
    # Install Terraform
    echo "Terraform not found. Installing..."
    if [[ $OS == "linux" ]]; then
        curl -fsSL https://apt.releases.hashicorp.com/gpg | sudo apt-key add -
        sudo apt-add-repository "deb [arch=amd64] https://apt.releases.hashicorp.com $(lsb_release -cs) main"
        sudo apt-get update && sudo apt-get install terraform
    elif [[ $OS == "osx" ]]; then
        brew install terraform
    elif [[ $OS == "windows" ]]; then
        choco install terraform
    fi
fi

# Check if TFLint is installed
if ! command -v tflint &> /dev/null
then
    # Install TFLint
    echo "TFLint not found. Installing..."
    if [[ $OS == "linux" ]]; then
        curl -sL https://raw.githubusercontent.com/terraform-linters/tflint/master/install_linux.sh | bash
    elif [[ $OS == "osx" ]]; then
        brew install tflint
    elif [[ $OS == "windows" ]]; then
        choco install tflint
    fi
fi

# Check if TFSec is installed
if ! command -v tfsec &> /dev/null
then
    # Install TFSec
    echo "TFSec not found. Installing..."
    if [[ $OS == "linux" ]]; then
        curl -sL https://github.com/aquasecurity/tfsec/releases/latest/download/tfsec-linux-amd64 -o tfsec && chmod +x tfsec && sudo mv tfsec /usr/local/bin/tfsec
    elif [[ $OS == "osx" ]]; then
        brew install tfsec
    elif [[ $OS == "windows" ]]; then
        choco install tfsec
    fi
fi

# Check if Terraform-docs is installed
if ! command -v terraform-docs &> /dev/null
then
    # Install Terraform-docs
    echo "Terraform-docs not found. Installing..."
    if [[ $OS == "linux" ]]; then
        curl -sL https://github.com/terraform-docs/terraform-docs/releases/latest/download/terraform-docs-linux-amd64 -o terraform-docs && chmod +x terraform-docs && sudo mv terraform-docs /usr/local/bin/terraform-docs
    elif [[ $OS == "osx" ]]; then
        brew install terraform-docs
    elif [[ $OS == "windows" ]]; then
        choco install terraform-docs
    fi
fi

echo "All required tools are installed."