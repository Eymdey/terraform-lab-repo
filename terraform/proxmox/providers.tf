# Proxmox BPG Provider

terraform {
  required_providers {
    proxmox = {
      source  = "bpg/proxmox"
      version = ">= 0.38.0"
    }
  }
}

provider "proxmox" {
  endpoint  = "https://<PROXMOX_IP>:8006/api2/json"
  api_token = "<USER>@pam!<TOKEN_ID>=<TOKEN_SECRET>"
  insecure  = true

  ssh {
    agent    = false
    username = "root"
    password = "<SSH_PASSWORD>"
  }
}
