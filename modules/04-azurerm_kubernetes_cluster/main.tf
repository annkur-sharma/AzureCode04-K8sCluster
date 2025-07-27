resource "azurerm_kubernetes_cluster" "child_kubernetes_cluster" {
  name                = var.child_k8s_cluster_name
  location            = var.child_resource_location
  resource_group_name = var.child_resource_group_name
  dns_prefix          = var.child_k8s_cluster_dns_name

  default_node_pool {
    name       = "system"
    node_count = 2
    vm_size    = "Standard_D2ds_v4"
  }

  network_profile {
    network_plugin      = "azure"   # ✅ Enables Azure CNI networking
    network_plugin_mode = "overlay" # ✅ Enables Azure CNI with overlay mode
    network_policy      = "calico"  # ✅ Allows use of Calico for network policy enforcement
    load_balancer_sku   = "standard"
  }

  identity {
    type = "SystemAssigned"
  }
}