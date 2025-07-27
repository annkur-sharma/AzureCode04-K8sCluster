## ⚠️ Update the subscription ID with your own id.
main_provider_subscription_id = "00000000-0000-0000-0000-000000000000" # ✅ Update this with your own subscription ID.

## ⚠️ Update the values to be used for creating the resources.
## ❌ Do not start resource name with number [0-9]. Always start with an alphabet. 
## ⚠️ Keep the values in ⚠️ lowercase (⚠️ 3 to 15 characters) to avoid validation issues during execution of code.
root_resource_group_name     = "rg-aks1"        # ✅ Update this with your own resource group name.
root_resource_location       = "France Central" # ✅ Update this with your own Azure region.
root_vnet_name               = "vnet"
root_subnet_name             = "subnet"
root_k8s_cluster_name        = "aks1"
root_k8s_cluster_dns_name    = "aks1-dns"
