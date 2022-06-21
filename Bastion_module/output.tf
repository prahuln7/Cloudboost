output "azure_bastion_host_id" {
  description = "The resource ID of the Bastion Host"
  value       = azurerm_bastion_host.main.id
}

output "azure_bastion_host_fqdn" {
  description = "The FQDN of the Bastion Host"
  value       = azurerm_bastion_host.main.dns_name
}
