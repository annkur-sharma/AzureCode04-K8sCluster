resource "random_string" "root_random_string" {
  length  = 10
  upper   = false
  lower   = true
  numeric = true
  special = false
}

resource "random_integer" "octet1" {
  min = 10
  max = 250
}

resource "random_integer" "octet2" {
  min = 1
  max = 254
}

resource "random_integer" "octet3" {
  min = 1
  max = 100
}

resource "random_integer" "octet4" {
  min = 0
  max = 0
}

locals {
  random_ip = "${random_integer.octet1.result}.${random_integer.octet2.result}.${random_integer.octet3.result}.${random_integer.octet4.result}"
}

module "module_resource_group" {
  source                    = "../modules/01-azurerm_resource_group"
  child_resource_group_name = "${var.root_resource_group_name}-${random_string.root_random_string.result}"
  child_resource_location   = var.root_resource_location
}

module "module_virtual_network" {
  depends_on                = [module.module_resource_group]
  source                    = "../modules/02-azurerm_virtual_network"
  child_resource_group_name = "${var.root_resource_group_name}-${random_string.root_random_string.result}"
  child_resource_location   = var.root_resource_location
  child_vnet_name           = "${var.root_vnet_name}-${random_string.root_random_string.result}"
  child_vnet_address_space  = ["${local.random_ip}/24"]
}

module "module_subnet" {
  depends_on                    = [module.module_virtual_network]
  source                        = "../modules/03-azurerm_subnet"
  child_resource_group_name     = "${var.root_resource_group_name}-${random_string.root_random_string.result}"
  child_vnet_name               = "${var.root_vnet_name}-${random_string.root_random_string.result}"
  child_subnet_name             = "${var.root_subnet_name}-${random_string.root_random_string.result}"
  child_subnet_address_prefixes = ["${local.random_ip}/28"]
}

module "module_kubernetes_cluster" {
  depends_on                 = [module.module_subnet]
  source                     = "../modules/04-azurerm_kubernetes_cluster"
  child_resource_group_name  = "${var.root_resource_group_name}-${random_string.root_random_string.result}"
  child_resource_location    = var.root_resource_location
  child_k8s_cluster_dns_name = "${var.root_k8s_cluster_dns_name}-${random_string.root_random_string.result}"
  child_k8s_cluster_name     = "${var.root_k8s_cluster_name}-${random_string.root_random_string.result}"
}
