# Proxmox - 3 VMs

variable "vm_count" {
  default = 3
}

resource "proxmox_virtual_environment_vm" "nodes" {
  count     = var.vm_count
  name      = "lab-node-${count.index + 1}"
  node_name = "pve"
  vm_id     = 200 + count.index

  clone {
    vm_id = 9000
    full  = true
  }

  cpu {
    cores   = 2
    sockets = 1
  }

  memory {
    dedicated = 2048
  }

  disk {
    interface    = "scsi0"
    datastore_id = "local-lvm"
    size         = 20
  }

  network_device {
    bridge = "vmbr0"
  }

  initialization {
    ip_config {
      ipv4 { address = "dhcp" }
    }
  }

  started = true
}

output "vm_ids" {
  value = proxmox_virtual_environment_vm.nodes[*].vm_id
}
