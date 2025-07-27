output "root_output_resource_group_name" {
  description = "Resource Group Name: "
  value       = "Resource Group Name: ${module.module_resource_group.child_output_resource_group_name}"
}

output "root_output_child_kubernetes_cluster" {
  description = "K8s Cluster Name: "
  value       = "K8s Cluster Name: ${module.module_kubernetes_cluster.child_output_child_kubernetes_cluster}"
}