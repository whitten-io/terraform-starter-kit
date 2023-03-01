<!-- BEGIN_TF_DOCS -->
# Workload

Workload description.

<!-- Infrastructure As Code -->
![Shell Script](https://img.shields.io/badge/shell_script-%23121011.svg?style=for-the-badge&logo=gnu-bash&logoColor=white)
![Terraform](https://img.shields.io/badge/terraform-%235835CC.svg?style=for-the-badge&logo=terraform&logoColor=white)

<!-- CI/CD -->
![GitHub](https://img.shields.io/badge/github-%23121011.svg?style=for-the-badge&logo=github&logoColor=white)

<!-- Logging -->
![Datadog](https://img.shields.io/badge/datadog-%23632CA6.svg?style=for-the-badge&logo=datadog&logoColor=white)
![AquaSec](https://img.shields.io/badge/aqua-%231904DA.svg?style=for-the-badge&logo=aqua&logoColor=#0018A8)
![Docker](https://img.shields.io/badge/docker-%230db7ed.svg?style=for-the-badge&logo=docker&logoColor=white)

<!-- Local Tooling -->
![Ubuntu](https://img.shields.io/badge/Ubuntu-E95420?style=for-the-badge&logo=ubuntu&logoColor=white)
![Windows](https://img.shields.io/badge/Windows-0078D6?style=for-the-badge&logo=windows&logoColor=white)
![macOS](https://img.shields.io/badge/mac%20os-000000?style=for-the-badge&logo=macos&logoColor=F0F0F0)


### Bash

- (VSCode Extension) [timonwong.shellcheck]()
- (VSCode Extension) [jetmartin.bats]()

## Project Setup

Ideally, most if not all of this is automated. 

## Setup Steps 

Fork this reppository to a new git repository, naming it whatever you wish.

- change the documentation in `./env/dev/main.tf`
- change the documentation in `./docs/header.md` . Specifically, add a _workload name_ and a _workload description_.

### Multi-Environment

To create additional environments, copy the folder `./env/dev` to `./env/<env>`  where `<env>` is the name of an environment such as qa,test,prod.
   

## Providers

No providers.

## Inputs

No inputs.

## Outputs

No outputs.
<!-- END_TF_DOCS -->