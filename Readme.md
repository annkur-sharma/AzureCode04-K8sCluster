# AzureCode04-K8sCluster
AzureCode04-K8sCluster - To setup RG, Vnet, Subnet, K8s Cluster for the resources.

## Summary
#### Following resources are created on the Azure Colud environment by executing the code.
- Resource Group
  - Virtual Network (VNet)
  - Subnet
  - K8s Cluster

## Step 01 - Update backend configuration in the below mentioned file.
#### ✅ Update the values to be used to backend configuration.
#### ⚠️ This is a pre-requisite to execute the code.
#### ❌ If the below resources are not present in the Azure Cloud, the terraform code will ❌ FAIL.
````yaml
📝 .\INFRA01\backend-config-infra01.hcl

---------------------------------------------------------------------------------------------------
# ✅ Update the values to be used to backend configuration.
# ⚠️ This is pre-requisite to execute the code.
# ❌ If the below resources are not present in the Azure Cloud, the terraform code will ❌ FAIL.

resource_group_name  = <ENTER backend - Resource Group>          # Example: "rg-backend"
storage_account_name = <ENTER backend - Storage Account>         # Example: "storageaccount"
container_name       = <ENTER backend - Storage Container Name>  # Example: "storagecontainer"
key                  = <ENTER backend - State File Name>         # Example: "a.terraform.tfstate"
````

## Step 02 - Update azure subscription id in the below mentioned file.
#### ✅ Update this with your own subscription ID.
````yaml
📝 infra01.auto.tfvars

---------------------------------------------------------------------------------------------------
# ✅ Update this variable with your own subscription ID.
main_provider_subscription_id = "00000000-0000-0000-000000000000"
````

## Step 03 - Following command needs to be executed to initialize the backend.
#### 💡 Run with -backend-config parameter, else the initialize will ask for user input.
````yaml
terraform init -backend-config='backend-config-infra01.hcl'
OR
terraform init -backend-config='backend-config-infra01.hcl' -upgrade
````

## Step 04 - Following commands can be used to proceed with infrastructure creation.
````yaml
terraform validate
terraform plan
````

## Step 05 - - Following commands can be used to proceed with infrastructure creation.
````yaml
terraform apply
````

# Output
### 📤 Output values displayed to user after successful execution of the code.
````yaml
Apply complete! Resources: 9 added, 0 changed, 0 destroyed.

Outputs:

root_output_child_kubernetes_cluster = "K8s Cluster Name: aks1-xxxxxxxxxx"          # ☸️ Kubernetes Cluster Name 
root_output_resource_group_name      = "Resource Group Name: rg-aks1-xxxxxxxxxx"    # 📦 Resource Group Name
````

# Next Steps
### 📤 Open Powershell CLI and execute the following command to merge the K8s cluster in your config file.
## Users can use the `kubectl` commands in their CLI.
````yaml
az aks get-credentials --name "aks1-xxxxxxxxxx" --resource-group "rg-aks1-xxxxxxxxxx" --overwrite-existing
````


# 🧠 Troubleshooting errors
##  Error⚡ Provisioning is restricted in this region. Please choose a different region.
````yaml
Error: creating Server (Subscription: "00000000-0000-0000-0000-000000000000"
│ Resource Group Name: "rg-tommy123"
│ Server Name: "tommy123-sqlserver"): polling after CreateOrUpdate: polling failed: the Azure API returned the following error:
│
│ Status: "ProvisioningDisabled"
│ Code: ""
│ Message: "Provisioning is restricted in this region. Please choose a different region. For exceptions to this rule please open a support request with Issue type of 'Service and subscription limits'. See https://docs.microsoft.com/en-us/azure/sql-database/quota-increase-request for more details."
│ Activity Id: ""
│ ---
│ API Response:
│ ----[start]----
│ {"name":"00000000-0000-0000-ae00-00000000","status":"Failed","startTime":"2025-06-19T03:03:53.143Z","error":{"code":"ProvisioningDisabled","message":"Provisioning is restricted in this region. Please choose a different region. For exceptions to this rule please open a support request with Issue type of 'Service and subscription limits'. See https://docs.microsoft.com/en-us/azure/sql-database/quota-increase-request for more details."}}
│ -----[end]-----
│   with module.module_kubernetes_cluster.azurerm_kubernetes_cluster.child_kubernetes_cluster,
│   on ..\modules\04-azurerm_kubernetes_cluster\main.tf line 1, in resource "azurerm_kubernetes_cluster" "child_kubernetes_cluster":
│    1: resource "azurerm_kubernetes_cluster" "child_kubernetes_cluster" {
````
🔧 In case you face above mentioned error, change the "root_resource_location" to "France Central" or any other available resource location.
````yaml
📝 infra01.auto.tfvars

---------------------------------------------------------------------------------------------------
# ✅ Update this variable with your own Azure region.
root_resource_location        = "France Central"
````