output "manage_disk_id" {
  value       = azurerm_managed_disk.main.id
  description = "Name of the manage disk id deployed to dev"
}
