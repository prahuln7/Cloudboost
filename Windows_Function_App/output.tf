output "app_service_plan_id" {
  description = "ID of the azure service plan"
  value = azurerm_service_plan.main.id
}
output "function_app_id" {
  description = "ID of the windows function app"
  value       = azurerm_windows_function_app.main.id
}