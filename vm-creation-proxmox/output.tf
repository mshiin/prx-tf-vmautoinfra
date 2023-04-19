output "vm_name" {
  value = proxmox_vm_qemu.resource_name.name
}
output "vm_target_node" {
  value = proxmox_vm_qemu.resource_name.target_node
}
