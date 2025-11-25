# Terraform config to launch Rancher 2

**Note: requires Terraform v0.13**

## Summary

This Terraform setup will:

- Start a droplet running `rancher/rancher` version specified in `rancher_version`
- Create an RKE2/K3s custom cluster called `cluster_name`
- Start `count_agent_all_nodes` amount of droplets and add them to the RKE2/K3s custom cluster with all roles
- If Rancher < v2.12, create an RKE1 custom cluster called `cluster_rke1_name`
- If Rancher < v2.12, start `count_rke1_agent_all_nodes` amount of droplets and add them to the RKE1 custom cluster with all roles
- Create an ssh_config file in the terraform module directory for connecting to the droplets

### Optional adding nodes per role
- Start `count_agent_master_nodes` amount of droplets and add them to the RKE2/K3s custom cluster with etcd and controlplane roles
- Start `count_agent_etcd_nodes` amount of droplets and add them to the RKE2/K3s custom cluster with etcd role
- Start `count_agent_controlplane_nodes` amount of droplets and add them to the RKE2/K3s custom cluster with controlplane role
- Start `count_agent_worker_nodes` amount of droplets and add them to the RKE2/K3s custom cluster with worker role
- Start `count_rke1_agent_master_nodes` amount of droplets and add them to the RKE1 custom cluster with etcd and controlplane roles
- Start `count_rke1_agent_etcd_nodes` amount of droplets and add them to the RKE1 custom cluster with etcd role
- Start `count_rke1_agent_controlplane_nodes` amount of droplets and add them to the RKE1 custom cluster with controlplane role
- Start `count_rke1_agent_worker_nodes` amount of droplets and add them to the RKE1 custom cluster with worker role

## Custom cluster configuration

The Kubernetes version of the RKE2/K3s custom cluster (e.g. `v1.33.6+rke2r1` or `v1.33.6+k3s1`) can be set via the `k8s_version` variable. Other configuration for the cluster, can be set directly on the `cluster.provisioning.cattle.io` manifest for the custom cluster, by editing the [`cluster.provisioning.cattle.io.yaml`](https://github.com/axeal/tf-do-rancher2/blob/master/files/cluster.provisioning.cattle.io.yaml) file.

The Kubernetes version of the RKE1 custom cluster (e.g. `v1.32.9-rancher1-1`) can be set via the `k8s_rke1_version` variable.

## Registry configuration

The rancher and rancher-agent images will by default be pulled from Docker Hub. You can specify an alternative registry for these two images with the `rancher_registry` option. If `rancher_registry` is specified, but the images cannot be successfully pulled from the registry, then it will fall back to Docker Hub.

## Other options

All available options/variables are described in [terraform.tfvars.example](https://github.com/axeal/tf-do-rancher2/blob/master/terraform.tfvars.example).

## Tools

You can add a tools node, which consists of some software that can be used for Rancher tooling like notifiers and logging. See below for more information on the current software included:

Note: replace PRIVATE_IP or PUBLIC_IP with tools-private-ip or tools-public-ip

| Software  | Endpoint | View command |
| ------------- | ------------- | ---------- |
| ElasticSearch | http://PRIVATE_IP:9200 | `docker logs elasticsearch` |
| Kibana  | http://PUBLIC_IP:5601  | `docker logs kibana` |
| SMTP (Mailhog) | http://PRIVATE_IP:1025 | `docker logs mailhog` |
| Echo server for HTTP requests | http://PRIVATE_IP:8080 | `docker logs echo` |
| Syslog (Syslog-NG) | http://PRIVATE_IP:514 | `docker logs syslog` |
| Fluentd | http://PRIVATE_IP:24224 | `docker logs fluentd` |

## SSH Config

**Note: set the appropriate users for the images in the terraform variables, default is `root`**

You can use the use the auto-generated ssh_config file to connect to the droplets by droplet name, e.g. `ssh <prefix>-rancheragent-all-0` or `ssh <prefix>-rancherserver` etc. To do so, you have two options:

1. Add an `Include` directive at the top of the SSH config file in your home directory (`~/.ssh/config`) to include the ssh_config file at the location you have checked out the this repository, e.g. `Include ~/git/tf-do-rancher2/ssh_config`.

2. Specify the ssh_config file when invoking `ssh` via the `-F` option, e.g. `ssh -F ~/git/tf-do-rancher2/ssh_config <host>`.

## How to use

- Clone this repository
- Move the file `terraform.tfvars.example` to `terraform.tfvars` and edit (see inline explanation)
- Run `terraform apply`
