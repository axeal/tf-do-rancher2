
terraform {
  required_version = ">= 0.13"
  required_providers {
    digitalocean = {
      source = "registry.opentofu.org/digitalocean/digitalocean"
    }
    local = {
      source = "registry.opentofu.org/hashicorp/local"
    }
    time = {
      source = "registry.opentofu.org/hashicorp/time"
    }
  }
}
