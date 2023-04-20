# CONFIG_VALUES
# No need to include api creds in here
proxmox_api_url             = "https://0.0.0.0:8006/api2/json"

# PROXMOX_VM_CONFIG_VALUES
  target_node = "CHANGE_TARGET_NODE"
  # Target node can be seen on the Proxmox Web UI under you virtual datacentre

  vmid = "103"
  # Change the vmid make sure its different ID from 
  
  name = "CHANGE_VM_NAME"
  # Name the machine you want to clone

  desc = "This is a ubuntu machine"
  onboot = false 
  clone = "CHANGE_CLONE_VM"
  # Identify the VM you want to clone under the target node
  agent = 1
  cores = 1
  sockets = 1
  cpu = "host"
  memory = 1024
  network_bridge = "vmbr0"
  network_model  = "virtio"
  os_type = "cloud-init"
  # ipconfig0 = "ip=0.0.0.0/0,gw=0.0.0.0"
  # ciuser = "your-username"
  # sshkeys = <<EOF
  # #YOUR-PUBLIC-SSH-KEY
  # EOF







