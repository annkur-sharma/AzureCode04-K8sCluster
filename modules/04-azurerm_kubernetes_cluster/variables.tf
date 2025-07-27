variable "child_resource_group_name" {
  type        = string
  description = "The name of the resource group where the virtual network will be created"
}

variable "child_resource_location" {
  type        = string
  description = "The Azure region where the virtual network will be created"
}

variable "child_k8s_cluster_name" {
  type        = string
  description = "The name of the K8s Cluster"
}

variable "child_k8s_cluster_dns_name" {
  type        = string
  description = "The name of the K8s Cluster DNS name"
}