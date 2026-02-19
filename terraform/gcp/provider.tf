terraform {
  required_providers {
    google = {
      source = "hashicorp/google"
      version = "6.12.0"
    }
    github = {
      source = "integrations/github"
      version = "6.11.1"
    }
  }
}

provider "google" {
  project     = "playground-s-11-684831c2"
  region      = "us-central1"
  credentials = file("account.json")
}

provider "github" {
  # Configuration options
}
