#!/bin/bash

# Find all subdirectories under ./modules
module_dirs=$(find ./modules -type d)

# Run TFLint, tfsec, and terraform-docs in each subdirectory
for dir in $module_dirs; do
  echo "Running TFLint in $dir"
  tflint $dir

  echo "Running tfsec in $dir"
  tfsec $dir

  echo "Running terraform-docs in $dir"
  terraform-docs markdown $dir
done
