variable "do_token" {
  default = "xxx"
}

variable "prefix" {
  default = "yourname"
}

variable "rancher_version" {
  default = "v2.7.9"
}

variable "audit_level" {
  default = 0
}

variable "rancher_args" {
  default = ""
}

variable "rancher_registry" {
  default = ""
}

variable "count_agent_all_nodes" {
  default = "3"
}

variable "count_agent_master_nodes" {
  default = "0"
}

variable "count_agent_etcd_nodes" {
  default = "0"
}

variable "count_agent_controlplane_nodes" {
  default = "0"
}

variable "count_agent_worker_nodes" {
  default = "0"
}

variable "count_tools_nodes" {
  default = "0"
}

variable "count_rke2_agent_all_nodes" {
  default = "0"
}

variable "count_rke2_agent_master_nodes" {
  default = "0"
}

variable "count_rke2_agent_etcd_nodes" {
  default = "0"
}

variable "count_rke2_agent_controlplane_nodes" {
  default = "0"
}

variable "count_rke2_agent_worker_nodes" {
  default = "0"
}

variable "admin_password" {
  default = "admin"
}

variable "cluster_name" {
  default = "custom"
}

variable "cluster_rke2_name" {
  default = "rke2custom"
}

variable "region_server" {
  default = "lon1"
}

variable "region_agent" {
  default = "lon1"
}

variable "size" {
  default = "s-4vcpu-8gb"
}

variable "all_size" {
  default = "s-4vcpu-8gb"
}

variable "master_size" {
  default = "s-4vcpu-8gb"
}

variable "etcd_size" {
  default = "s-4vcpu-8gb"
}

variable "controlplane_size" {
  default = "s-4vcpu-8gb"
}

variable "worker_size" {
  default = "s-4vcpu-8gb"
}

variable "tools_size" {
  default = "s-4vcpu-8gb"
}

variable "docker_version_server" {
  default = "24.0"
}

variable "docker_version_agent" {
  default = "24.0"
}

variable "docker_root" {
  default = ""
}

variable "k8s_version" {
  default = ""
}

variable "k8s_rke2_version" {
  default = ""
}

variable "rke_cni" {
  default = "canal"
}

variable "rke2_cni" {
  default = "calico"
}

variable "image_server" {
  default = "ubuntu-22-04-x64"
}

variable "image_agent" {
  default = "ubuntu-22-04-x64"
}

variable "image_tools" {
  default = "ubuntu-22-04-x64"
}

variable "user_server" {
  default = "root"
}

variable "user_agent" {
  default = "root"
}

variable "user_tools" {
  default = "root"
}

variable "kernel_nf_conntrack_max" {
  default = "131072"
}

variable "ssh_keys" {
  default = []
}

variable "hardening" {
  description = "Enable CIS hardening"
  type        = bool
  default     = false
}

variable "profile" {
  description = "Security profile for hardening (e.g., cis, cis-1.23)"
  type        = string
  default     = ""

  validation {
    condition = (
      (!var.hardening && var.profile == "") ||
      (var.hardening && contains(["cis", "cis-1.23"], var.profile))
    )
    error_message = "If hardening is enabled, profile must be one of [\"cis\", \"cis-1.23\"]. Otherwise, it must be empty."
  }
}

variable "psact" {
  description = "PodSecurityAdmissionConfigurationTemplateName (e.g., rancher-restricted). Required only if hardening is enabled."
  type        = string
  default     = ""

  validation {
    condition = (
      (!var.hardening && var.psact == "") ||
      (var.hardening && var.psact != "")
    )
    error_message = "If hardening is enabled, psact must be set (e.g., rancher-restricted). Otherwise, leave it empty."
  }
}
