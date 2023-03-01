# Instructions

Documentation for the project is generated from parts composed from markdown files in this folder. 

## Scripts

`cd` into the directory for the environment that you want to work in to run the following:. ie, `./env/dev`

- `make init` - terraform init
- `make plan` - terraform plan
- `make lint` - execute tflint using `.tflint.hcl` as configuration.
- `make docs` - execute documentation generation via terraform-docs.
- `make sec`  - execute static security scanning.
- `make install` - install the local tools needed. (terraform, terraform-ls, sentinel)
- `make test` - execute the tests (bash script tests only, sentinel coming soon)