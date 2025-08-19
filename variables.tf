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

variable "count_rke1_agent_all_nodes" {
  default = "0"
}

variable "count_rke1_agent_master_nodes" {
  default = "0"
}

variable "count_rke1_agent_etcd_nodes" {
  default = "0"
}

variable "count_rke1_agent_controlplane_nodes" {
  default = "0"
}

variable "count_rke1_agent_worker_nodes" {
  default = "0"
}

variable "admin_password" {
  default = "admin"
}

variable "cluster_rke1_name" {
  default = "rke1custom"
}

variable "cluster_name" {
  default = "custom"
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

variable "k8s_rke1_version" {
  default = ""
}

variable "k8s_version" {
  default = ""
}

variable "rke1_cni" {
  default = "canal"
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
