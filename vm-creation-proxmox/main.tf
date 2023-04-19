# This is where you deploy resources
# Couldn't create module for proxmox_vm_qeumu as proxmox provider has not released any modules yet
# Good practice to separate modules in another directory and reference them in main.tf
# 'proxmox_vm_qemu' resource type and resource_name is resource name
# proxmox_vm_qumu
resource "proxmox_vm_qemu" "resource_name" {
  target_node   = var.target_node
  vmid          = var.vmid
  name          = var.name
  desc          = var.desc
  cores         = var.cores
  sockets       = var.sockets
  cpu           = var.cpu
  memory        = var.memory
  
  network {
    bridge      = var.network_bridge
    model       = var.network_model
    }
  os_type       = var.os_type
  agent         = var.agent
  onboot        = var.onboot
  clone         = var.clone
}
