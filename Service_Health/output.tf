output "monitor_action_group_id" {
  description = "Id of the action group."
  value       = azurerm_monitor_action_group.main.id
}
output "template_deployment_id" {
  description = "Id of the Service Helath Template Deployment"
  value       = azurerm_template_deployment.template_deployment.id
}
