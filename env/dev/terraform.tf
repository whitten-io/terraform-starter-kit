terraform {
  required_providers {
    local = {
      source  = "hashicorp/local"
      version = "2.3.0"
    }

    github = {
      source  = "integrations/github"
      version = "5.18.0"
    }
  }
}
