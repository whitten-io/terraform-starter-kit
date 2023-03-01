#!/usr/bin/env bats

@test "check if Terraform is installed" {
    result=$(terraform --version)
    [ "$result" != 0 ]
}

@test "check if tflint is installed" {
    result=$(command -v tflint)
    [ "$result" != 0 ]
}

@test "check if tfsec is installed" {
    result=$(command -v tfsec)
    [ "$result" != 0 ]
}

@test "check if terraform-docs is installed" {
    result=$(command -v tfsec)
    [ "$result" != 0 ]
}
