variable "proxmox_api_url" {
    type        = string
}
variable "pm_api_token_id" {
  description = "Proxmox API token ID"
  type        = string
  sensitive   = false
}

variable "pm_api_token_secret" {
  description = "Proxmox API token secret"
  type        = string
  sensitive   = false
}

#VARIABLES_PROXMOX_VM
variable "target_node" {
  type = string
}
variable "vmid" {
  type = string
}
variable "name" {
  type = string
}
variable "desc" {
  type = string
}
variable "cores" {
  type = number
}
variable "sockets" {
  type = number
}
variable "cpu" {
  type = string
}
variable "memory" {
  type = number
}
variable "network_bridge" {
  type = string
}
variable "network_model" {
  type = string
}
variable "os_type" {
  type = string
}
variable "agent" {
  type = number
}
variable "onboot" {
  type = bool
}
variable "clone" {
  type = string
}
