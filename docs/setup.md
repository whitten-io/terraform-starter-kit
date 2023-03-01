## Project Setup

Ideally, most if not all of this is automated. 

## Setup Steps 

Fork this reppository to a new git repository, naming it whatever you wish.

- change the documentation in `./env/dev/main.tf`
- change the documentation in `./docs/header.md` . Specifically, add a _workload name_ and a _workload description_.

### Multi-Environment

To create additional environments, copy the folder `./env/dev` to `./env/<env>`  where `<env>` is the name of an environment such as qa,test,prod.
   