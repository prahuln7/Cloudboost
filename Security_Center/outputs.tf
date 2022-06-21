output "log_analytics_resource_id" {
  description = "Azure Log Analytics resource ID"
  value       = azurerm_log_analytics_workspace.security.id
}
output "log_analytics_workspace_id" {
  description = "Azure Log Analytics workspace ID"
  value       = azurerm_log_analytics_workspace.security.workspace_id
}
output "log_analytics_primary_shared_key" {
  description = "Azure Log Analytics workspace primary shared key"
  value       = azurerm_log_analytics_workspace.security.primary_shared_key
  sensitive   = true
}
output "security_center_workspace_id" {
  description = "Azure Security Center workspace ID"
  value       = azurerm_security_center_workspace.security.id
}