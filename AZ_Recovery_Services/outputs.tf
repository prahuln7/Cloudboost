output "recovery_vault_name" {
  description = "The name of the Recovery Services Vault"
  value       = azurerm_recovery_services_vault.main.name
}
output "recovery_vault_id" {
  description = "The ID of the Recovery Services Vault"
  value       = azurerm_recovery_services_vault.main.id
}