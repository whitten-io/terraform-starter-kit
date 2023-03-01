#!/bin/bash

cleanup() {
    echo "cleanup"
    rm awscliv2.zip
    rm ./aws/
}

install() {
    curl "https://awscli.amazonaws.com/awscli-exe-linux-x86_64.zip" -o "awscliv2.zip"
    unzip awscliv2.zip
    sudo ./aws/install
}

main() {
    install
    cleanup
}

main "$@"
