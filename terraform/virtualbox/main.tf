# VirtualBox - 3 VMs

terraform {
  required_providers {
    virtualbox = {
      source  = "terra-farm/virtualbox"
      version = "0.2.2-alpha.1"
    }
  }
}

variable "vm_count" {
  default = 3
}

resource "virtualbox_vm" "nodes" {
  count  = var.vm_count
  name   = "lab-vm-${count.index + 1}"
  image  = "https://cloud-images.ubuntu.com/focal/current/focal-server-cloudimg-amd64.ova"
  cpus   = 2
  memory = "2048 mib"

  network_adapter {
    type           = "bridged"
    host_interface = "Intel(R) Wi-Fi 6 AX201 160MHz"
  }

  status = "running"
}

output "vm_names" {
  value = virtualbox_vm.nodes[*].name
}
