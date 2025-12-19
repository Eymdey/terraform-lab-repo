# GitHub Provider

terraform {
  required_providers {
    github = {
      source  = "integrations/github"
      version = "~> 6.0"
    }
  }

  backend "local" {
    path = "terraform.tfstate"
  }
}

# Token à définir dans terraform.tfvars
variable "github_token" {
  type        = string
  description = "Token GitHub (Settings > Developer settings > Personal access tokens)"
}

provider "github" {
  token = var.github_token
}
