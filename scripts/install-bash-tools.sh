#!/bin/bash

# Install ShellCheck
sudo apt-get update
sudo apt-get install -y shellcheck

# Install shfmt
wget https://github.com/mvdan/sh/releases/latest/download/shfmt_linux_amd64 -O shfmt
chmod +x shfmt
sudo mv shfmt /usr/local/bin/shfmt

# Install Bats
git clone https://github.com/bats-core/bats-core.git
cd bats-core
./install.sh /usr/local
cd ..
rm -rf bats-core
