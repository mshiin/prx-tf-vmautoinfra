terraform {
  required_providers {
    proxmox = {
      source = "telmate/proxmox"
      version = "2.9.14"
    }
    }
}
provider "proxmox" {
    pm_api_url          = var.proxmox_api_url
    pm_api_token_id     = var.pm_api_token_id
    pm_api_token_secret = var.pm_api_token_secret
    # (Optional) Skip TLS Verification
    pm_tls_insecure     = true

}