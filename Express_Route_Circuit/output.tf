output "cicuit_id" {
  value       = azurerm_express_route_circuit.circuit.id
  description = "This is giving the Id of the express route circuit deployed in azure"
}
output "service_key" {
  value       = azurerm_express_route_circuit.circuit.service_key
  sensitive   = true
  description = "mentioning the service key of the express route circuit"
}