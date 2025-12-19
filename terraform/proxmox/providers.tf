# Proxmox BPG Provider

terraform {
  required_providers {
    proxmox = {
      source  = "bpg/proxmox"
      version = ">= 0.38.0"
    }
  }

  backend "local" {
    path = "terraform.tfstate"
  }
}

# Variables à définir dans terraform.tfvars
variable "proxmox_endpoint" {
  description = "URL API Proxmox (ex: https://192.168.1.100:8006/api2/json)"
}

variable "proxmox_token" {
  description = "Token API (format: user@pam!tokenid=secret)"
  sensitive   = true
}

variable "proxmox_ssh_password" {
  description = "Mot de passe SSH root Proxmox"
  sensitive   = true
}

provider "proxmox" {
  endpoint  = var.proxmox_endpoint
  api_token = var.proxmox_token
  insecure  = true

  ssh {
    agent    = false
    username = "root"
    password = var.proxmox_ssh_password
  }
}
