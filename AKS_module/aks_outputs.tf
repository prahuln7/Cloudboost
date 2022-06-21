output "network_plugin" {
  value = azurerm_kubernetes_cluster.main.network_profile.0.network_plugin
}

output "service_cidr" {
  value = azurerm_kubernetes_cluster.main.network_profile.0.service_cidr
}

output "dns_service_ip" {
  value = azurerm_kubernetes_cluster.main.network_profile.0.dns_service_ip
}

output "docker_bridge_cidr" {
  value = azurerm_kubernetes_cluster.main.network_profile.0.docker_bridge_cidr
}

output "pod_cidr" {
  value = azurerm_kubernetes_cluster.main.network_profile.0.pod_cidr
}

output "cluster_id" {
  value       = azurerm_kubernetes_cluster.main.id
  description = "Resource ID of the Kubernetes Cluster"
}

output "host" {
  value       = azurerm_kubernetes_cluster.main.kube_admin_config[0].host
  description = "The Kubernetes cluster server host"
}

output "client_certificate" {
  value       = base64decode(azurerm_kubernetes_cluster.main.kube_admin_config[0].client_certificate)
  sensitive   = true
  description = "Public certificate used by clients to authenticate to the Kubernetes cluster"
}

output "client_key" {
  value       = base64decode(azurerm_kubernetes_cluster.main.kube_admin_config[0].client_key)
  sensitive   = true
  description = "Private key used by clients to authenticate to the Kubernetes cluster"
}

output "cluster_ca_certificate" {
  value       = base64decode(azurerm_kubernetes_cluster.main.kube_admin_config[0].cluster_ca_certificate)
  sensitive   = true
  description = "Public CA certificate used as the root of trust for the Kubernetes cluster"
}

output "cluster_name" {
  value       = azurerm_kubernetes_cluster.main.name
  description = "Name of the Kubernetes Cluster"
}

output "cluster_kube_config" {
  value       = azurerm_kubernetes_cluster.main.kube_config_raw
  description = "config for the Kubernetes Cluster"
}

output "username" {
  value = azurerm_kubernetes_cluster.main.kube_config[0].username
}

output "password" {
  value = azurerm_kubernetes_cluster.main.kube_config[0].password
}

output "principal_id" {
  value = azurerm_kubernetes_cluster.main.kubelet_identity.0.object_id
}

output "agic_msi_id" {
  value = azurerm_kubernetes_cluster.main.addon_profile[0].ingress_application_gateway[0].ingress_application_gateway_identity[0].user_assigned_identity_id
}

output "agic_msi_principal_id" {
  value = azurerm_kubernetes_cluster.main.addon_profile[0].ingress_application_gateway[0].ingress_application_gateway_identity[0].object_id
}

output "appgw_id" {
  value = azurerm_kubernetes_cluster.main.addon_profile[0].ingress_application_gateway[0].effective_gateway_id
}
