#
provider "local" {
  # Configuration options
}

terraform {
  required_providers {
    github = {
      source  = "integrations/github"
      version = "5.18.0"
    }
  }
}

provider "github" {
  token = var.GITHUB_TOKEN # or `GITHUB_TOKEN`
}
