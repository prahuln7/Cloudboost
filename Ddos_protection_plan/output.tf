output "ddos_protection_plan" {
  description = "Ddos protection plan details"
  value       = azurerm_network_ddos_protection_plan.main.id
}
