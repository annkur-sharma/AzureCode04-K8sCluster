variable "main_provider_subscription_id" {
  type        = string
  description = "The Azure subscription ID"
}

variable "root_resource_group_name" {
  type        = string
  description = "The name of the resource group."
}

variable "root_resource_location" {
  type        = string
  description = "The Azure region where the resource group will be created."
}

variable "root_vnet_name" {
  type        = string
  description = "The name of the virtual network."
}

variable "root_subnet_name" {
  type        = string
  description = "The name of the subnet."
}

variable "root_k8s_cluster_name" {
  description = "The name of K8s Cluster name."
  type        = string
}

variable "root_k8s_cluster_dns_name" {
  description = "The name of K8s Cluster DNS name."
  type        = string
}